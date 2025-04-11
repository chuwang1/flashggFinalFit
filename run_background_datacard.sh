#!/bin/bash
start_time=$(date +%s)
# export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
source ./setup.sh
localWorkDir=${PWD}
cd ${localWorkDir}/../
eval `scram runtime -sh`

cd ${localWorkDir}/Signal


for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/*-"$1"_*gghh*.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
    # python3 RunPackager.py --cats resolved_$cat --exts dcb_2017_res_M"$2"_M"$i"_$cat,dcb_2018_res_M"$2"_M"$i"_$cat,dcb_2016pre_res_M"$2"_M"$i"_$cat,dcb_2016post_res_M"$2"_M"$i"_$cat --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_res_"$2"_M"$i"_$cat
        
    # python3 RunPlotter.py --procs all --cats resolved_$cat --years 2017,2018,2016pre,2016post  --ext packaged_mergeyears_res_"$2"_M"$i"_$cat 

cp /afs/cern.ch/work/c/chuw/bbgg/CMSSW_14_1_0_pre4/src/flashggFinalFit/Signal/outdir_packaged_mergeyears_res_"$2"_M"$1"_$cat/Plots/smodel_resolved_$cat.png ~/eosweb/bbgg_diphoton/res_"$2"_M"$1"_$cat.png

done


for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/*-"$1"_*ttH*.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
    
    # python3 RunPackager.py --cats resolved_$cat --exts dcb_2017_res_ttH_M"$2"_M"$i"_$cat,dcb_2018_res_ttH_M"$2"_M"$i"_$cat,dcb_2016pre_res_ttH_M"$2"_M"$i"_$cat,dcb_2016post_res_ttH_M"$2"_M"$i"_$cat --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_res_ttH_"$2"_M"$i"_$cat
        
    # python3 RunPlotter.py --procs all --cats resolved_$cat --years 2017,2018,2016pre,2016post  --ext packaged_mergeyears_res_ttH_"$2"_M"$i"_$cat 

done





for file in  allsys/2018_"$2"/config_dijet_"$2"*_"$1"_*cat*.py
do
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}
        # python3 RunPackager.py --cats resolved_$cat --exts dcb_2018_res_dijet_M"$2"_M"$y"_"$cat",dcb_2017_res_dijet_M"$2"_M"$y"_"$cat",dcb_2016pre_res_dijet_M"$2"_M"$y"_"$cat",dcb_2016post_res_dijet_M"$2"_M"$y"_"$cat" --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_res_dijet_"$2"_M"$y"_"$cat"
done




for file in  allsys/2018_"$2"/config_ttH_dijet_"$2"*_$1_*cat*.py
do
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}
        # python3 RunPackager.py --cats resolved_$cat --exts dcb_2018_res_ttH_dijet_M"$2"_M"$y"_"$cat",dcb_2017_res_ttH_dijet_M"$2"_M"$y"_"$cat",dcb_2016pre_res_ttH_dijet_M"$2"_M"$y"_"$cat",dcb_2016post_res_ttH_dijet_M"$2"_M"$y"_"$cat" --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_ttH_res_dijet_"$2"_M"$y"_"$cat"
   
done


for file in  allsys/2018_"$2"/config_dijet_"$2"*_"$1"_*cat*.py
do
        cat=${file##*'_'}
        
        cat=${cat%'.'*}

        y=${file%'_'$cat'.'*}
        y=${y##*'_'}
        echo $y
        mkdir -p ./res_"$2"/Doublefit_"$cat"_"$y"
       
    #   echo "  python3 createMjjMggModel.py --inp-file outdir_packaged_mergeyears_res_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_res_"$2"_M"$y"_"$cat"_resolved_"$cat".root --inp-file-mjj outdir_packaged_mergeyears_res_dijet_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_res_dijet_"$2"_M"$y"_"$cat"_resolved_"$cat".root --out-dir ./res_"$2"/Doublefit_"$cat"_"$y"/ --inp-procs gghh --mass $y --cats resolved_"$cat" "
        # python3 createMjjMggModel.py --inp-file outdir_packaged_mergeyears_res_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_res_"$2"_M"$y"_"$cat"_resolved_"$cat".root --inp-file-mjj outdir_packaged_mergeyears_res_dijet_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_res_dijet_"$2"_M"$y"_"$cat"_resolved_"$cat".root --out-dir ./res_"$2"/Doublefit_"$cat"_"$y"/ --inp-procs gghh --mass $y --cats resolved_"$cat"
    
done
# exit



for file in  allsys/2018_"$2"/config_ttH_dijet_"$2"*_$1_*cat*.py
do
		echo "$file"
        cat=${file##*'_'}
		
        
        cat=${cat%'.'*}
		# cat="cat0"
        y=${file%'_'$cat'.'*}
        y=${y##*'_'}
        # python3 createMjjMggModel.py --inp-file outdir_packaged_mergeyears_res_ttH_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_res_ttH_"$2"_M"$y"_"$cat"_resolved_"$cat".root --inp-file-mjj outdir_packaged_mergeyears_ttH_res_dijet_"$2"_M"$y"_"$cat"/CMS-HGG_sigfit_packaged_mergeyears_ttH_res_dijet_"$2"_M"$y"_"$cat"_resolved_"$cat".root --out-dir ./res_"$2"/Doublefit_"$cat"_"$y"/ --inp-procs ttH --mass $y --cats resolved_"$cat"
   
done



cd ${localWorkDir}/Background
for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/*-"$1"_*gghh*.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
mkdir -p config_all/data_all_"$2"
cp config_all/config_2Dfit_template.py config_all/data_all_"$2"/config_2Dfit_"$cat"_"$1".py 
sed -i "s#XMASS#$2#g" config_all/data_all_"$2"/config_2Dfit_"$cat"_"$1".py  
sed -i "s#YMASS#$1#g" config_all/data_all_"$2"/config_2Dfit_"$cat"_"$1".py  
sed -i "s#CAT#$cat#g" config_all/data_all_"$2"/config_2Dfit_"$cat"_"$1".py  
done
for file in config_all/data_all_"$2"/config_2Dfit*cat*_$1.*
do
    newfile=${file%'.'*}
    y=${newfile##*'_'}
 if [ "$y" -le 150 ]; then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  10. --do2d 0 
		# echo "python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  10."
        elif [ "$y" -lt 300 ] && [ "$y" -gt 150 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  10.  --do2d 0 
        elif [ "$y" -lt 500 ] && [ "$y" -ge 300 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  10.  --do2d 0 
        elif [ "$y" -lt 900 ] && [ "$y" -ge 500 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  10.  --do2d 0 
        elif [ "$y" -lt 1500 ] && [ "$y" -ge 900 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  20.  --do2d 0 
        elif [ "$y" -lt 2000 ] && [ "$y" -ge 1500 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  20.   --do2d 0 
        elif [ "$y" -lt 2500 ] && [ "$y" -ge 2000 ];then
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth  20.  --do2d 0 
        else
    		python3 RunBackgroundScripts.py --inputConfig $file --mode fTestParallel --binWidth 20. --do2d 0 
	fi
done



exit



path='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_'$2'_boost/opt/2017/root'
cd ${localWorkDir}/Datacard
for file in $path/signalNMSSM*MY-$1*cat*.root
do
    newfile=${file%'_Tune'*}
    i=${newfile##*'MY-'}
    cat=${file%.*}
    cat=${cat##*'boost_'}
#     # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000_boost/opt/2018/root/addsys/ws_ttH_"$cat"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2018/root/addsys/ws_gghh_"$cat"_$i
#     # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000_boost/opt/2017/root/addsys/ws_ttH_"$cat"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2017/root/addsys/ws_gghh_"$cat"_$i
#     # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000_boost/opt/2016pre/root/addsys/ws_ttH_"$cat"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i
#     # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000_boost/opt/2016post/root/addsys/ws_ttH_"$cat"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016post/root/addsys/ws_gghh_"$cat"_$i
#     # cp ${localWorkDir}/Signal/boost_1000/outdir_packaged_mergeyears_boost_masscut_1000_M100_"$cat"/CMS-HGG_sigfit_packaged_boosted_"$cat"_ttH.root ${localWorkDir}/Signal/boost_"$2"/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"
#     # mv ${localWorkDir}/Signal/boost_"$2"/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/CMS-HGG_sigfit_packaged_boosted_"$cat".root   ${localWorkDir}/Signal/boost_"$2"/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"/CMS-HGG_sigfit_packaged_boosted_"$cat"_gghh.root

    # echo "python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2018/root/addsys/ws_gghh_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2017/root/addsys/ws_gghh_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016post/root/addsys/ws_gghh_"$cat"_$i  --sigModelWSDir ${localWorkDir}/Signal/boost_"$2"/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"  --bkgModelWSDir /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000_boost/opt/data/root/ws_"$cat" --cats boosted_"$cat" --procs gghh --batch local --mergeYears --doSystematics --ignore-warnings --ext sys_boost_"$2"_combine_"$cat"_M$i" 
    python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2018/root/addsys/ws_gghh_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2017/root/addsys/ws_gghh_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"_boost/opt/2016post/root/addsys/ws_gghh_"$cat"_$i  --sigModelWSDir ${localWorkDir}/Signal/boost_"$2"/outdir_packaged_mergeyears_boost_masscut_"$2"_M"$i"_"$cat"  --bkgModelWSDir /afs/cern.ch/user/c/chuw/chuw/bbgg/CMSSW_14_1_0_pre4/src/flashggFinalFit/Background/outdir_boosted --cats boosted_"$cat" --procs gghh --batch local --mergeYears --doSystematics --ignore-warnings --ext sys_boost_"$2"_combine_"$cat"_M$i 
    # echo "python3 makeDatacard.py --years 2018,2017,2016pre,2016post   --ext 'sys_boost_'$2'_combine_'$cat'_M'$i''  --output Datacard_sys_boost_"$2"_combine_"$cat"_M$i --doSystematics "
    python3 makeDatacard.py --years 2018,2017,2016pre,2016post   --ext 'sys_boost_'$2'_combine_'$cat'_M'$i''  --output Datacard_sys_boost_"$2"_combine_"$cat"_M$i --doSystematics 
done
# exit

for file in $path/signalN*MY-$1*cat*.root
do
#     newfile=${file%'_Tune'*}
#     i=${newfile##*'MY-'}
#     cat=${file%.*}
#     cat=${cat##*'boost_'}

    combineCards.py  Datacard_sys_boost_"$2"_combine_cat0_M$i.txt Datacard_sys_boost_"$2"_combine_cat1_M$i.txt Datacard_sys_boost_"$2"_combine_cat2_M$i.txt  > Datacard_sys_boost_"$2"_combined_M$i.txt
    # combine -M AsymptoticLimits -m 125 -n boost_masscut_$i  Datacard_sys_boost_masscut_combined_M$i.txt --run expected >> limit_boost_masscut.log
#     # echo $newfile >> limit_boost_masscut.log
done

mv Datacard_sys_boost_"$2"_combined_M$i.txt all_$2


for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/*-"$1"_*cat*gghh.root
do
	echo "==========="$file

    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    cat=${file%'_201'*}
    cat=${cat##*'_'}
  
    # cp ${localWorkDir}/Background/outdir_"$2"_2Dfit_M$i/*$cat*.root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/data/root/ws_"$cat"_"$i"
    # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/ws_ttH_"$cat"_"$i"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/ws_gghh_"$cat"_$i
    # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2017/root/addsys/ws_ttH_"$cat"_"$i"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2017/root/addsys/ws_gghh_"$cat"_$i
    # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016pre/root/addsys/ws_ttH_"$cat"_"$i"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i
    # cp /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016post/root/addsys/ws_ttH_"$cat"_"$i"/*root  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016post/root/addsys/ws_gghh_"$cat"_$i
    # python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/ws_gghh_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2017/root/addsys/ws_gghh_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016post/root/addsys/ws_gghh_"$cat"_$i  --sigModelWSDir ${localWorkDir}/Signal/res_"$2"/Doublefit_"$cat"_"$i"  --bkgModelWSDir /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/data/root/ws_"$cat"_"$i" --cats resolved_"$cat" --procs gghh,ttH --batch local --mergeYears --doSystematics --ignore-warnings --ext sys_res_"$2"_combine_"$cat"_M$i 
    # python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/ws_*_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2017/root/addsys/ws_*_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016pre/root/addsys/ws_*_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016post/root/addsys/ws_*_"$cat"_$i  --sigModelWSDir ${localWorkDir}/Signal/res_"$2"/Doublefit_"$cat"_"$i"  --bkgModelWSDir $localWorkDir/Background/outdir_${2}_2Dfit_M${1} --cats resolved_"$cat" --procs gghh,ttH --batch local --mergeYears  --ignore-warnings --ext sys_res_"$2"_combine_"$cat"_M$i   --doSystematics --do2DFits
    python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/ws_*_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2017/root/addsys/ws_*_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016pre/root/addsys/ws_*_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2016post/root/addsys/ws_*_"$cat"_$i  --sigModelWSDir ${localWorkDir}/Signal/res_"$2"/Doublefit_"$cat"_"$i"  --bkgModelWSDir $localWorkDir/Background/outdir_${2}_2Dfit_M${1} --cats resolved_"$cat" --procs gghh,ttH --batch local --mergeYears  --ignore-warnings --ext sys_res_"$2"_combine_"$cat"_M$i   --doSystematics 

    python3 makeDatacard.py --years 2018,2017,2016pre,2016post   --ext 'sys_res_'$2'_combine_'$cat'_M'$i''  --output Datacard_sys_res_"$2"_combine_"$cat"_M$i --doSystematics 
done


mkdir -p ${localWorkDir}/Datacard/all_$2/ 
for file in /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_"$2"/opt/2018/root/addsys/*MY-$1*cat0*gghh.root
do
    newfile=${file%'_cat'*}
    i=${newfile##*'MY-'}
    datacardname=""
    for file in Datacard_sys_res_"$2"_combine_*_M"$i".txt
    do
        
        datacardname="$datacardname $file"

        
    done
    # echo $datacardname
    combineCards.py $datacardname >  Datacard_sys_res_"$2"_combined_M"$i".txt 
    mv Datacard_sys_res_"$2"_combined_M"$i".txt all_$2
    # echo $datacardname 
done

cd ${localWorkDir}/Datacard/all_$2
if [ -e Datacard_sys_boost_"$2"_combined_M"$1".txt ]; then
        combineCards.py  Datacard_sys_boost_"$2"_combined_M"$1".txt Datacard_sys_res_"$2"_combined_M"$1".txt  > Datacard_all_"$2"_combined_M$1.txt
else
        cp Datacard_sys_res_"$2"_combined_M"$1".txt  Datacard_all_"$2"_combined_M$1.txt
fi
    
combine -M AsymptoticLimits -m 125 -n all_"$2"_$1  Datacard_all_"$2"_combined_M$1.txt --run expected >>limit_${2}_${1}.log
# echo $newfile >> limit_$2.log
