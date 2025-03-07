# Config file: options for signal fitting

_year = 'YEAR'

signalScriptCfg = {
  
  # Setup
  'inputWSDir':'/eos/cms/store/group/phys_higgs/cmshgg/zhjie/output/output_XMASS/opt/YEAR/root/addsys/ws_gghh_CAT_YMASS',
  'procs':'auto', # if auto: inferred automatically from filenames
  'cats':'auto', # if auto: inferred automatically from (0) workspace
  'ext':'dcb_%s_res_dijet_MXMASS_MYMASS_CAT'%_year,
  'analysis':'STXS', # To specify which replacement dataset mapping (defined in ./python/replacementMap.py)
  'year':'%s'%_year, # Use 'combined' if merging all years: not recommended
  'massPoints':'125',

  #Photon shape systematics  
  'scales':'scale', # separate nuisance per year
  'scalesCorr':'material,fnuf', # correlated across years
  'scalesGlobal':'', # affect all processes equally, correlated across years
  'smears':'smear', # separate nuisance per year

  # Job submission options
  'batch':'local', # ['condor','SGE','IC','local']
  'queue':'hep.q'
  #'batch':'condor', # ['condor','SGE','IC','local']
  #'queue':'espresso',

}
