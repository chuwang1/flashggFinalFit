# Python file to store systematics: for STXS analysis

# Comment out all nuisances that you do not want to include

# THEORY SYSTEMATICS:

# For type:constant
#  1) specify same value for all processes
#  2) define process map json in ./theory_uncertainties (add process names where necessary!)

# For type:factory
# Tier system: adds different uncertainties to dataframe
#   1) shape: absolute yield of process kept constant, shape effects i.e. calc migrations across cats
#   2) ishape: as (1) but absolute yield for proc x cat is allowed to vary
#   3) norm: absolute yield of production mode (s0) kept constant but migrations across sub-processes e.g. STXS bins.Same value in each category.
#   4) inorm: as (3) but absolute yield of production mode (s0) can vary
#   5) inc: variations in production mode (s0), same value for each subprocess in each category
# Relations: shape = ishape/inorm
#            norm  = inorm/inc
# Specify as list in dict: e.g. 'tiers'=['inc','inorm','norm','ishape','shape']

theory_systematics = [
                # Normalisation uncertainties: enter interpretations
                {'name':'BR_hgg','title':'BR_hgg','type':'constant','prior':'lnN','correlateAcrossYears':1,'value':"0.98/1.021"},
                # New scheme for ggH stage 1.2 
                
          
				{'name':'QCDscale_ttH','title':'QCDscale_ttH','type':'constant','prior':'lnN','correlateAcrossYears':1,'value':"0.908/1.058"},
                {'name':'pdf_Higgs_ttH','title':'pdf_Higgs_ttH','type':'constant','prior':'lnN','correlateAcrossYears':1,'value':"1.030"},
                {'name':'alphaS_ttH','title':'alphaS_ttH','type':'constant','prior':'lnN','correlateAcrossYears':1,'value':"1.020"}
              
               
              ]
# PDF weight
# for i in range(1,60): theory_systematics.append( {'name':'pdfWeight_%g'%i, 'title':'CMS_hgg_pdfWeight_%g'%i, 'type':'factory','prior':'lnN','correlateAcrossYears':1,'tiers':['shape']} )

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# EXPERIMENTAL SYSTEMATICS
# correlateAcrossYears = 0 : no correlation
# correlateAcrossYears = 1 : fully correlated
# correlateAcrossYears = -1 : partially correlated

experimental_systematics = [
                # Updated luminosity partial-correlation scheme: 13/5/21 (recommended simplified nuisances)
                {'name':'lumi_13TeV_Uncorrelated','title':'lumi_13TeV_Uncorrelated','type':'constant','prior':'lnN','correlateAcrossYears':0,'value':{'2016pre':'1.010','2016post':'1.010','2017':'1.020','2018':'1.015'}},
                {'name':'lumi_13TeV_Correlated','title':'lumi_13TeV_Correlated','type':'constant','prior':'lnN','correlateAcrossYears':-1,'value':{'2016pre':'1.006','2016post':'1.006','2017':'1.009','2018':'1.020'}},
                {'name':'lumi_13TeV_Correlated_1718','title':'lumi_13TeV_Correlated_1718','type':'constant','prior':'lnN','correlateAcrossYears':-1,'value':{'2016pre':'-','2016post':'-','2017':'1.006','2018':'1.002'}},
                {'name':'photon_id_sf_Diphoton_Photon_','title':'CMS_hgg_MVASF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'photon_presel_sf_Diphoton_Photon_','title':'CMS_hgg_PreselSF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'electron_veto_sf_Diphoton_Photon_','title':'CMS_hgg_electronVetoSF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'trigger_sf_','title':'CMS_hgg_TriggerWeight','type':'factory','prior':'lnN','correlateAcrossYears':0},
               
                {'name':'L1_prefiring_sf_','title':'CMS_hgg_prefire','type':'factory','prior':'lnN','correlateAcrossYears':0},
				{'name':'puid_','title':'PuJetID','type':'factory','prior':'lnN','correlateAcrossYears':0},
               
                {'name':'puWeight_','title':'CMS_hgg_puWeight','type':'factory','prior':'lnN','correlateAcrossYears':0},

                {'name':'btag_deepjet_sf_SelectedbJet_jes_','title':'CMS_hgg_btag_jes','type':'factory','prior':'lnN','correlateAcrossYears':1},
                {'name':'btag_deepjet_sf_SelectedbJet_lf_','title':'CMS_hgg_btag_lf','type':'factory','prior':'lnN','correlateAcrossYears':1},
                {'name':'btag_deepjet_sf_SelectedbJet_hfstats1_','title':'CMS_hgg_btag_hfstats1','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'btag_deepjet_sf_SelectedbJet_hfstats2_','title':'CMS_hgg_btag_hfstats2','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'btag_deepjet_sf_SelectedbJet_cferr1_','title':'CMS_hgg_btag_cferr1','type':'factory','prior':'lnN','correlateAcrossYears':1},
                {'name':'btag_deepjet_sf_SelectedbJet_cferr2_','title':'CMS_hgg_btag_cferr2','type':'factory','prior':'lnN','correlateAcrossYears':1},
                {'name':'btag_deepjet_sf_SelectedbJet_hf_','title':'CMS_hgg_btag_hf','type':'factory','prior':'lnN','correlateAcrossYears':1},
                {'name':'btag_deepjet_sf_SelectedbJet_lfstats1_','title':'CMS_hgg_btag_lfstats1','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'btag_deepjet_sf_SelectedbJet_lfstats2_','title':'CMS_hgg_btag_lfstats2','type':'factory','prior':'lnN','correlateAcrossYears':0},

                # {'name':'PNet_','title':'CMS_hgg_ParticalNet','type':'factory','prior':'lnN','correlateAcrossYears':0},

                {'name':'JES','title':'CMS_scale_j','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'JER','title':'CMS_res_j','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'FJER','title':'CMS_res_fj','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'FJES','title':'CMS_scale_fj','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'FJHEM','title':'CMS_FatjetHEM','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'JetHEM','title':'CMS_JetHEM','type':'factory','prior':'lnN','correlateAcrossYears':0}

              ]
experimental_systematics_boost=[
                # Updated luminosity partial-correlation scheme: 13/5/21 (recommended simplified nuisances)
                {'name':'lumi_13TeV_Uncorrelated','title':'lumi_13TeV_Uncorrelated','type':'constant','prior':'lnN','correlateAcrossYears':0,'value':{'2016pre':'1.010','2016post':'1.010','2017':'1.020','2018':'1.015'}},
                {'name':'lumi_13TeV_Correlated','title':'lumi_13TeV_Correlated','type':'constant','prior':'lnN','correlateAcrossYears':-1,'value':{'2016pre':'1.006','2016post':'1.006','2017':'1.009','2018':'1.020'}},
                {'name':'lumi_13TeV_Correlated_1718','title':'lumi_13TeV_Correlated_1718','type':'constant','prior':'lnN','correlateAcrossYears':-1,'value':{'2016pre':'-','2016post':'-','2017':'1.006','2018':'1.002'}},
                {'name':'photon_id_sf_Diphoton_Photon_','title':'CMS_hgg_MVASF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'photon_presel_sf_Diphoton_Photon_','title':'CMS_hgg_PreselSF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'electron_veto_sf_Diphoton_Photon_','title':'CMS_hgg_electronVetoSF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'trigger_sf_','title':'CMS_hgg_TriggerWeight','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'L1_prefiring_sf_','title':'CMS_hgg_prefire','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'puWeight_','title':'CMS_hgg_puWeight','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'PNet_','title':'CMS_hgg_ParticalNet','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'FJER','title':'CMS_FJER','type':'factory','prior':'lnN','correlateAcrossYears':0},  
                {'name':'FJES','title':'CMS_FJES','type':'factory','prior':'lnN','correlateAcrossYears':0},    
                # {'name':'FJESAbsoluteMPFBias','title':'CMS_FJESAbsoluteMPFBias','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESAbsoluteScale','title':'CMS_FJESAbsoluteScale','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESAbsoluteStat','title':'CMS_FJESAbsoluteStat','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESFlavorQCD','title':'CMS_FJESFlavorQCD','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESFragmentation','title':'CMS_FJESFragmentation','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESPileUpDataMC','title':'CMS_FJESPileUpDataMC','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESPileUpPtBB','title':'CMS_FJESPileUpPtBB','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESPileUpPtEC1','title':'CMS_FJESPileUpPtEC1','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESPileUpPtEC2','title':'CMS_FJESPileUpPtEC2','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESPileUpPtHF','title':'CMS_FJESPileUpPtHF','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESPileUpPtRef','title':'CMS_FJESPileUpPtRef','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeBal','title':'CMS_FJESRelativeBal','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeFSR','title':'CMS_FJESRelativeFSR','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeJEREC1','title':'CMS_FJESRelativeJEREC1','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeJEREC2','title':'CMS_FJESRelativeJEREC2','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeJERHF','title':'CMS_FJESRelativeJERHF','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativePtBB','title':'CMS_FJESRelativePtBB','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativePtEC1','title':'CMS_FJESRelativePtEC1','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESRelativePtEC2','title':'CMS_FJESRelativePtEC2','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESRelativePtHF','title':'CMS_FJESRelativePtHF','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESRelativeSample','title':'CMS_FJESRelativeSample','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESRelativeStatEC','title':'CMS_FJESRelativeStatEC','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESRelativeStatFSR','title':'CMS_FJESRelativeStatFSR','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESRelativeStatHF','title':'CMS_FJESRelativeStatHF','type':'factory','prior':'lnN','correlateAcrossYears':0},
                # {'name':'FJESSinglePionECAL','title':'CMS_FJESSinglePionECAL','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESSinglePionHCAL','title':'CMS_FJESSinglePionHCAL','type':'factory','prior':'lnN','correlateAcrossYears':1},
                # {'name':'FJESTimePtEta','title':'CMS_FJESTimePtEta','type':'factory','prior':'lnN','correlateAcrossYears':0},
                {'name':'FJHEM','title':'CMS_FatjetHEM','type':'factory','prior':'lnN','correlateAcrossYears':0},

              ]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Shape nuisances: effect encoded in signal model
# mode = (other,scalesGlobal,scales,scalesCorr,smears): match the definition in the signal models

signal_shape_systematics = [
              
                {'name':'scale','title':'scale','type':'signal_shape','mode':'scales','mean':'0.0','sigma':'1.0'},
            
                {'name':'material','title':'material','type':'signal_shape','mode':'scalesCorr','mean':'0.0','sigma':'1.0'},

                {'name':'fnuf','title':'fnuf','type':'signal_shape','mode':'scalesCorr','mean':'0.0','sigma':'1.0'},
        
                {'name':'smear','title':'smear','type':'signal_shape','mode':'smears','mean':'0.0','sigma':'1.0'}
           
              ]
