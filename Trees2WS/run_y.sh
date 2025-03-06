
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2017/root/signal-MX-650-MY-90_2017_cat0.root --inputMass 125 --productionMode gghh --year 2017  
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2018/root/signal-MX-650-MY-90_2018_cat0.root --inputMass 125 --productionMode gghh --year 2018 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016pre/root/signal-MX-650-MY-90_2016pre_cat0.root --inputMass 125 --productionMode gghh --year 2016pre 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016post/root/signal-MX-650-MY-90_2016post_cat0.root --inputMass 125 --productionMode gghh --year 2016post 


python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2017/root/signal-MX-650-MY-90_2017_cat1.root --inputMass 125 --productionMode gghh --year 2017  
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2018/root/signal-MX-650-MY-90_2018_cat1.root --inputMass 125 --productionMode gghh --year 2018 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016pre/root/signal-MX-650-MY-90_2016pre_cat1.root --inputMass 125 --productionMode gghh --year 2016pre 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016post/root/signal-MX-650-MY-90_2016post_cat1.root --inputMass 125 --productionMode gghh --year 2016post


python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2017/root/signal-MX-650-MY-90_2017_cat2.root --inputMass 125 --productionMode gghh --year 2017  
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2018/root/signal-MX-650-MY-90_2018_cat2.root --inputMass 125 --productionMode gghh --year 2018 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016pre/root/signal-MX-650-MY-90_2016pre_cat2.root --inputMass 125 --productionMode gghh --year 2016pre 
python trees2ws.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016post/root/signal-MX-650-MY-90_2016post_cat2.root --inputMass 125 --productionMode gghh --year 2016post



python trees2ws_data.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/data/root/data_cat0.root 
python trees2ws_data.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/data/root/data_cat1.root 
python trees2ws_data.py --inputConfig config_simple.py --inputTreeFile /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/data/root/data_cat2.root 

cd /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2017/root
mkdir ws_gghh_cat0
mkdir ws_gghh_cat1
mkdir ws_gghh_cat2
mv ws_gghh/*cat0*.root  ws_gghh_cat0/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat0_2017_M125_pythia8_gghh.root
mv ws_gghh/*cat1*.root  ws_gghh_cat1/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat1_2017_M125_pythia8_gghh.root
mv ws_gghh/*cat2*.root  ws_gghh_cat2/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat2_2017_M125_pythia8_gghh.root

cd /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2018/root
mkdir ws_gghh_cat0
mkdir ws_gghh_cat1
mkdir ws_gghh_cat2
mv ws_gghh/*cat0*.root  ws_gghh_cat0/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat0_2018_M125_pythia8_gghh.root
mv ws_gghh/*cat1*.root  ws_gghh_cat1/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat1_2018_M125_pythia8_gghh.root
mv ws_gghh/*cat2*.root  ws_gghh_cat2/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat2_2018_M125_pythia8_gghh.root

cd /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016pre/root
mkdir ws_gghh_cat0
mkdir ws_gghh_cat1
mkdir ws_gghh_cat2
mv ws_gghh/*cat0*.root  ws_gghh_cat0/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat0_2016pre_M125_pythia8_gghh.root
mv ws_gghh/*cat1*.root  ws_gghh_cat1/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat1_2016pre_M125_pythia8_gghh.root
mv ws_gghh/*cat2*.root  ws_gghh_cat2/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat2_2016pre_M125_pythia8_gghh.root


cd /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/2016post/root
mkdir ws_gghh_cat0
mkdir ws_gghh_cat1
mkdir ws_gghh_cat2
mv ws_gghh/*cat0*.root  ws_gghh_cat0/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat0_2016post_M125_pythia8_gghh.root
mv ws_gghh/*cat1*.root  ws_gghh_cat1/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat1_2016post_M125_pythia8_gghh.root
mv ws_gghh/*cat2*.root  ws_gghh_cat2/output_NMSSM_XToYHTo2B2G_MX-650_MY-90_cat2_2016post_M125_pythia8_gghh.root


cd /eos/cms/store/group/phys_higgs/cmshgg/zhjie/check_650_90/res/data/root
mkdir ws_cat0
mkdir ws_cat1
mkdir ws_cat2
mv ws/*cat0*.root  ws_cat0/allData.root
mv ws/*cat1*.root  ws_cat1/allData.root
mv ws/*cat2*.root  ws_cat2/allData.root