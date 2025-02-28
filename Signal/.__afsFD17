#!/bin/bash
start_time=$(date +%s)
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh

cd /eos/user/z/zhjie/CMSSW_10_2_13/src/
eval `scram runtime -sh`


d0='_2017_M125_pythia8_gghh.root'
d1='_2018_M125_pythia8_gghh.root'
d2='_2016pre_M125_pythia8_gghh.root'
d3='_2016post_M125_pythia8_gghh.root'
m='_gghh'
c0='_cat0'
c1='_cat1'
c2='_cat2'

cd /eos/user/z/zhjie/CMSSW_10_2_13/src/flashggFinalFit 

sh hadd.sh $1 $2 $3



sh hadd_singleH.sh $1 $2 $3


cd /eos/user/z/zhjie/CMSSW_10_2_13/src/flashggFinalFit/Trees2WS

folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'/opt/'$3'/root/addsys'
for file in $folder_signal/*-$1_*ttH*.root
do
{
 
    newfile=${file%'_cat'*}
    y=${newfile##*'MY-'}
   
    python trees2ws.py --inputConfig config_sys_res.py --inputTreeFile $file --inputMass 125 --productionMode ttH --year "$3" --jetmass $y --low 0 --high 1000  --doSystematics
     
}
done



folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'/opt/'$3'/root/addsys'
for file in $folder_signal/*-$1_*gghh*.root
do
{
   
    newfile=${file%'_cat'*}
    y=${newfile##*'MY-'}
    cat=${file##*'MY-'}
    cat=${cat#*'_'}
    cat=${cat%%'_'*}
    if [ "$y" -le 150 ]; then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 40 --high 190  # --doSystematics 
    elif [ "$y" -lt 300 ] && [ "$y" -gt 150 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 70 --high 400 # --doSystematics 
    elif [ "$y" -lt 500 ] && [ "$y" -ge 300 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 150 --high 560   --doSystematics  
    elif [ "$y" -lt 900 ] && [ "$y" -ge 500 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 300 --high 1000   --doSystematics 
    elif [ "$y" -lt 1500 ] && [ "$y" -ge 900 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 500 --high 1500   --doSystematics 
    elif [ "$y" -lt 2000 ] && [ "$y" -ge 1500 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 700 --high 2000   --doSystematics 
    elif [ "$y" -lt 2500 ] && [ "$y" -ge 2000 ];then
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 900 --high 2500   --doSystematics 
    else
        python trees2ws.py --inputConfig config_sys.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year $3 --jetmass $y --low 1000 --high 3000   --doSystematics 
    fi
   
}
done



folder_data='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'/opt/data/root'
for file in $folder_data/*_$1_*cat*.root
do
{
    
    newfile=${file%'_cat'*}
    y=${newfile##*'data_'}
    python trees2ws_data.py --inputConfig config_simple.py --inputTreeFile $file --jetmass $y 

}
done


cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/data/root

for file in *_$1_*.root
do
    
    
    newfile=${file%'.'*}
    cat=${newfile##*'_'}
    y=${file%'_cat'*}
    y=${y##*'_'}

    mkdir -p ws_"$cat"_"$y"
    mv  ws/data_"$y"_"$cat".root  ws_"$cat"_"$y"/allData.root
done

cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/"$3"/root/addsys
for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/"$3"/root/addsys/*MY-$1_*gghh*.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
    mkdir -p ws_gghh_"$cat"_$i
    mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_"$3"_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_"$3"_M125_pythia8_gghh.root
done


cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/"$3"/root/addsys
for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/"$3"/root/addsys/*MY-$1_*ttH*.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
    mkdir -p ws_ttH_"$cat"_$i
    mv ws_ttH/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_"$3"_M125_pythia8_ttH_ttH.root  ws_ttH_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_"$3"_M125_pythia8_ttH.root
done





cd /eos/user/z/zhjie/CMSSW_10_2_13/src/flashggFinalFit/Signal

for file in allsys/"$3"_"$2"/config_"$2"*_$1_*.py
do
    echo $file
    python RunSignalScripts.py --inputConfig $file --mode 'fTest' 
    python RunSignalScripts.py --inputConfig $file  --mode calcPhotonSyst
    python RunSignalScripts.py --inputConfig $file --mode 'signalFit'  
done


for file in allsys/"$3"_"$2"/config_ttH_"$2"*_$1_*.py
do
   
    python RunSignalScripts.py --inputConfig $file --mode 'fTest' 
    python RunSignalScripts.py --inputConfig $file  --mode calcPhotonSyst
    python RunSignalScripts.py --inputConfig $file --mode 'signalFit'  
done





for file in  allsys/"$3"_"$2"/config_dijet_$2_"$3"_"$1"_cat*.py
do
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}
        if [ "$y" -le 150 ]; then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 40 --MHHigh 190  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 30' 
        elif [ "$y" -lt 300 ] && [ "$y" -gt 150 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 70 --MHHigh 400  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 66' 
        elif [ "$y" -lt 500 ] && [ "$y" -ge 300 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 150 --MHHigh 560  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 82' 
        elif [ "$y" -lt 900 ] && [ "$y" -ge 500 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 300 --MHHigh 1000  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 140' 
        elif [ "$y" -lt 1500 ] && [ "$y" -ge 900 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 500 --MHHigh 1500  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 200' 
        elif [ "$y" -lt 2000 ] && [ "$y" -ge 1500 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 700 --MHHigh 2000  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 260' 
        elif [ "$y" -lt 2500 ] && [ "$y" -ge 2000 ];then
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 900 --MHHigh 2500  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 320'
        else
            python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --MHLow 1000 --MHHigh 3000  --mass '$y' --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 400'

    
        fi
done


for file in  allsys/"$3"_"$2"/config_ttH_dijet_"$2"*_$1_*cat*.py
do
       
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}

        python RunSignalScripts.py --inputConfig $file --mode 'signalFit' --modeOpts '--useDCB --xvar Dijet_mass --mass '$y' --MHLow 0 --MHHigh 1000 --skipSystematics --doPlots --skipVertexScenarioSplit --nBins 25' 
done


