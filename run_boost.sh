#!/bin/bash
start_time=$(date +%s)
source /cvmfs/cms.cern.ch/cmsset_default.sh
localWorkDir='/afs/cern.ch/user/c/chuw/chuw/bbgg/CMSSW_14_1_0_pre4/src/flashggFinalFit'
cd $localWorkDir
eval `scram runtime -sh`


## 9179225  9179239 9179246
start_time=$(date +%s)
cd $localWorkDir/Trees2WS
path='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2017/root'

folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2017/root/addsys'
for file in $folder_signal/*$1*gghh*.root
do
{
    echo $file
    # python3 trees2ws.py --inputConfig config_sys_boost.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year 2017   --doSystematics
}
done

folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2018/root/addsys'
for file in $folder_signal/*$1*gghh*.root
do
{
    echo $file
    # python3 trees2ws.py --inputConfig config_sys_boost.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year 2018   --doSystematics
}
done


folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2016pre/root/addsys'
for file in $folder_signal/*$1*gghh*.root
do
{
    echo $file
    # python3 trees2ws.py --inputConfig config_sys_boost.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year 2016pre  --doSystematics
}
done

folder_signal='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2016post/root/addsys'
for file in $folder_signal/*$1*gghh*.root
do
{
    echo $file
    # python3 trees2ws.py --inputConfig config_sys_boost.py --inputTreeFile $file --inputMass 125 --productionMode gghh --year 2016post  --doSystematics
}
done

cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2017/root/addsys

for file in $path/signalN*$2*$1_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
    # mkdir -p ws_gghh_"$cat"_$i
    # mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2017_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2017_M125_pythia8_gghh.root
   
done
cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2018/root/addsys

for file in $path/signalN*$2*$1_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
    # mkdir -p ws_gghh_"$cat"_$i
    # mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2018_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2018_M125_pythia8_gghh.root
done

cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016pre/root/addsys

for file in $path/signalN*$2*$1_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
    # mkdir -p ws_gghh_"$cat"_$i
    # mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016pre_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016pre_M125_pythia8_gghh.root
done

cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016post/root/addsys

for file in $path/signalN*$2*$1_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
    # mkdir -p ws_gghh_"$cat"_$i
    # mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016post_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016post_M125_pythia8_gghh.root
done



cd $localWorkDir/Signal
mkdir -p boost_$2/
echo "================"$PWD

mkdir -p config_boost_"$2" 
years=("2016pre" "2016post" "2017" "2018")
for myYear in "${years[@]}"
do
for file in $path/signalN*$2*$1_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
	echo "$cat"
	echo "$myYear"
	
	cp config_boost_template.py config_boost_"$2"/config_"$2"_${myYear}_${1}_$cat.py
	sed -i "s#YEAR#$myYear#g" config_boost_"$2"/config_"$2"_${myYear}_${1}_*.py
	sed -i "s#XMASS#$2#g" config_boost_"$2"/config_"$2"_${myYear}_${1}_*.py
	sed -i "s#YMASS#$1#g" config_boost_"$2"/config_"$2"_${myYear}_${1}_*.py
	sed -i "s#CAT#$cat#g" config_boost_"$2"/config_"$2"_${myYear}_${1}_*.py
    # mkdir -p ws_gghh_"$cat"_$i
    # mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016post_M125_pythia8_gghh_gghh.root  ws_gghh_"$cat"_$i/output_NMSSM_XToYHTo2B2G_MX-"$2"_MY-"$i"_"$cat"_2016post_M125_pythia8_gghh.root
done
done
for file in config_boost_"$2"/config_"$2"_201*_${1}_*.py
do
{
    echo "chuw: "$file
    python3 RunSignalScripts.py --inputConfig $file --mode 'fTest'  
    python3 RunSignalScripts.py --inputConfig $file  --mode calcPhotonSyst
    # python3 RunSignalScripts.py --inputConfig $file --mode getEffAcc

    python3 RunSignalScripts.py --inputConfig $file --mode 'signalFit' 
}
done

for file in $path/signalN*MX-${2}*_*MY-${1}_*.root
do
	echo $file
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
    python3 RunPackager.py --cats boosted_$cat --exts dcb_2017_boost_masscut_M"$2"_M"$i"_$cat,dcb_2018_boost_masscut_M"$2"_M"$i"_$cat,dcb_2016pre_boost_masscut_M"$2"_M"$i"_$cat,dcb_2016post_boost_masscut_M"$2"_M"$i"_$cat --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_boost_masscut_"$2"_M"$i"_$cat
        
    python3 RunPlotter.py --procs all --cats boosted_$cat --years 2017,2018,2016pre,2016post  --ext packaged_mergeyears_boost_masscut_"$2"_M"$i"_$cat 

done
for file in $path/signalN*MX-${2}*_*MY-${1}_*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
   
    file0=`ls outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/*.root`
	
    echo "cp $file0  outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/CMS-HGG_sigfit_packaged_boosted_"$cat"_gghh.root"
    cp $file0  outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/CMS-HGG_sigfit_packaged_boosted_"$cat"_gghh.root
	# rm -rf boost_$2/ 
	if [ -d "boost_$2/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/" ];	
	then
    mv outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/* boost_$2/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/
	else
	mv outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/ boost_$2/
	fi	
      
done

