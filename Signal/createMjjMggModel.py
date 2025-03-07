import numpy as np
import ROOT
import json

from optparse import OptionParser


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
def get_options():

    parser = OptionParser()
    parser.add_option("--date",type='string',dest='date',default='18_02_2020_Mjj_merged_90GeV')  
    #parser.add_option("--date",type='string',dest='date',default='12_02_2020_mjjnorm')  
    parser.add_option("--mass",type='string',dest='mass',default='125') 
    parser.add_option("--inp-procs",type='string',dest='inp_procs',default='gghh')  
    parser.add_option("--inp-dir",type='string',dest="inp_dir",default='./Mjjgg/')
    #parser.add_option("--inp-dir-mjj",type='string',dest="inp_dir_mjj",default='/work/nchernya/DiHiggs/CMSSW_7_4_7/src/flashggFinalFit/Signal/output/mjj/18_02_2020_2D/')
    parser.add_option("--inp-dir-mjj",type='string',dest="inp_dir_mjj",default='/work/nchernya/DiHiggs/CMSSW_7_4_7/src/flashggFinalFit/Signal/output/mjj/18_02_2020_Mjj_merged_90GeV/')
    parser.add_option("--inp-file",type='string',dest="inp_file",default='CMS-HGG_sigfit_2016_2017_2018_18_02_2020.root')
    parser.add_option("--inp-file-mjj",type='string',dest="inp_file_mjj",default='workspace_out_mjj_18_02_2020_merged_90GeV.root')
    #parser.add_option("--inp-dir-mjj",type='string',dest="inp_dir_mjj",default='/work/nchernya/DiHiggs/CMSSW_7_4_7/src/flashggFinalFit/Signal/output/mjj/04_02_2020_v3/')
    #parser.add_option("--inp-file",type='string',dest="inp_file",default='CMS-HGG_sigfit_2016_2017_2018_04_02_2020.root')
    #parser.add_option("--inp-file-mjj",type='string',dest="inp_file_mjj",default='workspace_out_mjj_12_02_2020.root')
    parser.add_option("--out-dir",type='string',dest="out_dir",default='../res_1000/Doublefit/')
    #parser.add_option("--cats",type='string',dest="cats",default='DoubleHTag_0,DoubleHTag_1,DoubleHTag_2,DoubleHTag_3,DoubleHTag_4,DoubleHTag_5,DoubleHTag_6,DoubleHTag_7,DoubleHTag_8,DoubleHTag_9,DoubleHTag_10,DoubleHTag_11')
   # parser.add_option("--cats",type='string',dest="cats",default='DoubleHTag_0,DoubleHTag_1,DoubleHTag_2,DoubleHTag_3,DoubleHTag_4,DoubleHTag_5,DoubleHTag_6,DoubleHTag_7,DoubleHTag_8,DoubleHTag_9')
    parser.add_option("--cats",type='string',dest="cats",default='resolved_cat0')
    return parser.parse_args()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

(opt,args) = get_options()
cats = opt.cats.split(',')
input_procs = opt.inp_procs.split(',')

print("check",input_procs)

tfile = ROOT.TFile(opt.inp_file)
tfile_mjj = ROOT.TFile(opt.inp_file_mjj)
ws_mgg = tfile.Get("wsig_13TeV")
ws_mjj = tfile_mjj.Get("wsig_13TeV")
for num,f in enumerate(input_procs):
  # for year in '2017,2018,2016pre,2016post'.split(','):
  for year in '2017,2018,2016pre,2016post'.split(','):
    for cat_num,cat in enumerate(cats) : 
    #for cat_num,cat in enumerate([cats[0]]) : 
      pdf_mjj_old = "hjjpdfsmrel_%s_%s_%s_13TeV"%(input_procs[num],year,cat)
      pdf_mjj = "hjjpdfsmrel_%s_%s_%s_13TeV"%(input_procs[num],year,cat)
      new_pdf = ws_mjj.pdf(pdf_mjj)
    #   new_pdf = old_pdf.Clone(pdf_mjj)
    #   new_pdf.SetName(pdf_mjj)
      
      pdf_mgg = "hggpdfsmrel_%s_%s_%s_13TeV"%(input_procs[num],year,cat)
     
      getattr(ws_mgg, 'import')(new_pdf,ROOT.RooCmdArg())
      # getattr(ws_mgg, 'import')(ws_mjj.var("Dijet_mass"),ROOT.RooCmdArg())
      prod_pdf = "hhbbggpdfsmrel_%s_%s_%s_13TeV"%(input_procs[num],year,cat)
     
      sig_prod_pdf = ROOT.RooProdPdf(prod_pdf,"",ws_mgg.pdf(pdf_mgg),new_pdf)
      #sig_prod_pdf.Print("v") 
      getattr(ws_mgg, 'import')(sig_prod_pdf,ROOT.RooFit.RecycleConflictNodes())
      #Save normalization for combine
      #sig_prod_pdf_norm = (ws_mgg.function(pdf_mgg+"_norm")).clone(prod_pdf+"_norm")
      sig_prod_pdf_norm = (ws_mjj.function(pdf_mjj_old+"_norm")).clone(prod_pdf+"_norm")  #take norm from mjj?
      getattr(ws_mgg, 'import')(sig_prod_pdf_norm,ROOT.RooFit.RecycleConflictNodes())
      ##Printing normalization
    # ws_mgg.var("MH").setVal(125.)  #just to check that the normalization is the same for Mgg and Mjj, it is of course.
    #  print 'mgg : ',ws_mgg.function(pdf_mgg+"_norm").getVal(),', mjj : ',ws_mjj.function(pdf_mjj+"_norm").getVal(), ", imported product : ",ws_mgg.function(prod_pdf+"_norm").getVal() #just to check that the normalization is the same for Mgg and Mjj, it is of course.
      
 
f_out = ROOT.TFile.Open(opt.out_dir+"CMS-HGG_sigfit_packaged_%s_%s.root"%(opt.cats,input_procs[num]),"RECREATE")
ws_mgg.Write()
f_out.Close()