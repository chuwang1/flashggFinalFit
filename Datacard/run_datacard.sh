
path='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/data/'
cd $CMSSW_BASE/src/flashggFinalFit/Datacard

for file in $path/data_*400*cat0*.parquet
do
    newfile=${file%'_cat'*}
    i=${newfile##*'data_'}
    cat=${file%.*}
    cat=${cat##*'_'}  
    echo $cat
    python3 RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2018/root/addsys/ws_gghh_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2017/root/addsys/ws_gghh_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016post/root/addsys/ws_gghh_"$cat"_$i  --sigModelWSDir $CMSSW_BASE/src/flashggFinalFit/Signal/outdir_packaged_mergeyears_resolved_M1000_M"$i"_"$cat"  --bkgModelWSDir $CMSSW_BASE/src/flashggFinalFit/Background/outdir_1000_M400/ --cats resolved_"$cat" --procs gghh --batch local --mergeYears --doSystematics --ignore-warnings --ext sys_resolved_combine_M1000_"$cat"_M$i 
    python3 makeDatacard.py --years 2018,2017,2016pre,2016post --prune --ext sys_resolved_combine_M1000_"$cat"_M$i  --output Datacard_sys_resolved_combine_M1000_"$cat"_M$i --doSystematics 
done
combine -M AsymptoticLimits -m 125 -n resolved_masscut_$i  Datacard_sys_resolved_combine_M1000_cat0_M$i.txt --run expected

# for file in $path/signal*2017*cat0.root
# do
#     newfile=${file%'_Tune'*}
#     i=${newfile##*'MY-'}
#     cat=${file%.*}
#     cat=${cat##*'boost_'}
#     echo $i
#     combineCards.py  Datacard_sys_boost_1000_combine_cat0_M$i.txt Datacard_sys_boost_1000_combine_cat1_M$i.txt Datacard_sys_boost_1000_combine_cat2_M$i.txt Datacard_sys_resolved_combine_M1000_cat0_M$i.txt  > Datacard_sys_1000_combined_M$i.txt
    
# done
# for file in $path/data_*.root
# do
#     newfile=${file%'_cat'*}
#     i=${newfile##*'data_'}
#     cat=${file%.*}
#     cat=${cat##*'_'}

#     combineCards.py  Datacard_sys_boost_masscut_combine_cat0_M$i.txt Datacard_sys_boost_masscut_combine_cat1_M$i.txt Datacard_sys_boost_masscut_combine_cat2_M$i.txt  > Datacard_sys_boost_masscut_combined_M$i.txt
#     combine -M AsymptoticLimits -m 125 -n boost_masscut_$i  Datacard_sys_boost_masscut_combined_M$i.txt --run expected >> limit_boost_masscut.log
#     echo $newfile >> limit_boost_masscut.log
# done



# # path='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/data'
# # for file in $path/data_*cat0*.parquet
# # do
# #     newfile=${file%'_cat'*}
# #     i=${newfile##*'data_'}
# #     cat=${file%.*}
# #     cat=${cat##*'_'}  

# #     python RunYields.py --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2018/root/addsys/ws_gghh_"$cat"_$i,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2017/root/addsys/ws_gghh_"$cat"_$i,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016pre/root/addsys/ws_gghh_"$cat"_$i,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016post/root/addsys/ws_gghh_"$cat"_$i  --sigModelWSDir $CMSSW_BASE/src/flashggFinalFit/Signal/signal_1000/outdir_packaged_mergeyears_resolved_M1000_M"$i"_$cat/CMS-HGG_sigfit_packaged_resolved_"$cat".root --bkgModelWSDir $CMSSW_BASE/src/flashggFinalFit/Background/outdir_1000_M400/ws_"$cat"_$i --cats resolved_"$cat" --procs auto --batch local --mergeYears --doSystematics --ignore-warnings --ext sys_resolved_combine_M1000_"$cat"_M$i 
# #     python makeDatacard.py --years 2018,2017,2016pre,2016post --prune --ext sys_resolved_combine_M1000_"$cat"_M$i  --output Datacard_sys_resolved_combine_M1000_"$cat"_M$i --doSystematics 
# # done