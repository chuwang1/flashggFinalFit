#!/bin/bash
start_time=$(date +%s)
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh

cd /afs/cern.ch/work/c/chuw/bbgg/CMSSW_14_1_0_pre4/src/
eval `scram runtime -sh`


d0='_2017_M125_pythia8_gghh.root'
d1='_2018_M125_pythia8_gghh.root'
d2='_2016pre_M125_pythia8_gghh.root'
d3='_2016post_M125_pythia8_gghh.root'
m='_gghh'
c0='_cat0'
c1='_cat1'
c2='_cat2'


path='/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/data'
# cd /eos/user/z/zhjie/CMSSW_10_2_13/src/flashggFinalFit/Trees2WS
  ###
# python3 trees2ws.py --inputConfig config_sys.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2017/root/addsys/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2017_M125_pythia8_gghh.root --inputMass 125 --productionMode gghh --year 2017 --jetmass 400 --low 150 --high 560  --doSystematics
# python3 trees2ws.py --inputConfig config_sys.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2018/root/addsys/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2018_M125_pythia8_gghh.root --inputMass 125 --productionMode gghh --year 2018 --jetmass 400 --low 150 --high 560  --doSystematics
# python3 trees2ws.py --inputConfig config_sys.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016pre/root/addsys/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016pre_M125_pythia8_gghh.root --inputMass 125 --productionMode gghh --year 2016pre --jetmass 400 --low 150 --high 560  --doSystematics
# python3 trees2ws.py --inputConfig config_sys.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016post/root/addsys/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016post_M125_pythia8_gghh.root --inputMass 125 --productionMode gghh --year 2016post --jetmass 400 --low 150 --high 560  --doSystematics
# python3 trees2ws_data.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/data/root/data_400_cat0.root --jetmass 400 --low 150 --high 560
# cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2017/root/addsys
# mkdir -p ws_gghh_cat0_400
# mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2017_M125_pythia8_gghh_gghh.root  ws_gghh_cat0_400/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2017_M125_pythia8_gghh.root
# cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2018/root/addsys
# mkdir -p ws_gghh_cat0_400
# mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2018_M125_pythia8_gghh_gghh.root  ws_gghh_cat0_400/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2018_M125_pythia8_gghh.root
# cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016pre/root/addsys
# mkdir -p ws_gghh_cat0_400
# mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016pre_M125_pythia8_gghh_gghh.root  ws_gghh_cat0_400/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016pre_M125_pythia8_gghh.root
# cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016post/root/addsys
# mkdir -p ws_gghh_cat0_400
# mv ws_gghh/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016post_M125_pythia8_gghh_gghh.root  ws_gghh_cat0_400/output_NMSSM_XToYHTo2B2G_MX-1000_MY-400_cat0_2016post_M125_pythia8_gghh.root
# cd  /eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/data/root/
# mkdir -p ws_cat0_400
# mv ws/data_400_cat0.root ws_cat0_400/allData.root 
cd /afs/cern.ch/work/c/chuw/bbgg/CMSSW_14_1_0_pre4/src/flashggFinalFit/Signal/ 
python3 RunSignalScripts.py --inputConfig configs/config_1000_2017_400_cat0.py --mode 'fTest'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2017_400_cat0.py  --mode calcPhotonSyst
python3 RunSignalScripts.py --inputConfig configs/config_1000_2017_400_cat0.py --mode 'signalFit'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2018_400_cat0.py --mode 'fTest'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2018_400_cat0.py  --mode calcPhotonSyst
python3 RunSignalScripts.py --inputConfig configs/config_1000_2018_400_cat0.py --mode 'signalFit'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016pre_400_cat0.py --mode 'fTest'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016pre_400_cat0.py  --mode calcPhotonSyst
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016pre_400_cat0.py --mode 'signalFit'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016post_400_cat0.py --mode 'fTest'
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016post_400_cat0.py  --mode calcPhotonSyst
python3 RunSignalScripts.py --inputConfig configs/config_1000_2016post_400_cat0.py --mode 'signalFit'
python3 RunPackager.py --cats resolved_cat0 --exts dcb_2017_res_M1000_M400_cat0,dcb_2018_res_M1000_M400_cat0,dcb_2016pre_res_M1000_M400_cat0,dcb_2016post_res_M1000_M400_cat0 --batch local  --massPoints 125 --mergeYears --outputExt packaged_mergeyears_resolved_M1000_M400_cat0
python3 RunPlotter.py --procs all --cats resolved_cat0 --years 2017,2018,2016pre,2016post  --ext packaged_mergeyears_resolved_M1000_M400_cat0
file0=`ls outdir_packaged_mergeyears_resolved_M1000_M400_cat0/*.root`
cp $file0  outdir_packaged_mergeyears_resolved_M1000_M400_cat0/CMS-HGG_sigfit_packaged_resolved_cat0.root
cd /afs/cern.ch/work/c/chuw/bbgg/CMSSW_14_1_0_pre4/src/flashggFinalFit/Background
python3 RunBackgroundScripts.py --inputConfig configs/config_all_cat0_400.py --mode fTestParallel
