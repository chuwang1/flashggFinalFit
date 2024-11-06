#!/bin/bash
ulimit -s unlimited
set -e
cd /afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src
export SCRAM_ARCH=el9_amd64_gcc12
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/Datacard
export PYTHONPATH=$PYTHONPATH:/afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/tools:/afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/Datacard/tools

python3 /afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/Datacard/makeYields.py --cat resolved_cat0 --procs gghh --ext sys_resolved_combine_M1000_cat0_M400 --mass 125 --inputWSDirMap 2018=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2018/root/addsys/ws_gghh_cat0_400,2017=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2017/root/addsys/ws_gghh_cat0_400,2016pre=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016pre/root/addsys/ws_gghh_cat0_400,2016post=/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_1000/opt/2016post/root/addsys/ws_gghh_cat0_400 --sigModelWSDir /afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/Signal/outdir_packaged_mergeyears_resolved_M1000_M400_cat0 --sigModelExt packaged --bkgModelWSDir /afs/cern.ch/work/c/chuw/bbgg/test/CMSSW_14_1_0_pre4/src/flashggFinalFit/Background/outdir_1000_M400/ --bkgModelExt multipdf  --mergeYears --doSystematics --ignore-warnings
