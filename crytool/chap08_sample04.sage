print("\n# CHAP08 -- Script-SAMPLE 04: =========")

def Display(F,fname):
    ### Same function as in chap03_sample03.sage
    ### Alternative to F.show() or F.plot() which work in sage CLI, but not in a sage script
    ### - works under Ubuntu (adapt path and viewer name for other OS)
    pngfile='/tmp/'+fname+'.png'; # print("pngfile=", pngfile)
    F.save(pngfile,axes=True)
    oscommand='eog '+ pngfile + ' &'; # print("oscommand=", oscommand)
    os.system(oscommand)  # eog = Eye of GNOME file viewer

print("... Creating one graphics")
plot1 = plot(2*x-1, (x,0,1))
plot2 = plot((2*x - 1)**2, (x,0,1), color = 'green')
xlabel = text('$p$', (1.0, -0.1), fontsize = 20, color = 'black')
legend1 = text('$\tau = 2p - 1$', (0.75,0.8), fontsize = 30)
legend2 = text('$\lambda = (2p - 1)^2$', (0.2,0.9), fontsize = 30, color = 'green')
Display(plot1 + plot2 + xlabel + legend1 + legend2, "Plot_relation-probability-correlation")


