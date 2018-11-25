import matplotlib.pyplot as plt
#handles, labels = plt.get_legend_handles_labels()
#plt.legend(handles, labels)

raw=plt.plot([4,5,6,7,8], [90702.5444704989,90794.3748918331,90826.6132851584,90841.9655356220,90850.0970707134], 'ro',markersize=15,label='Raw')
Kutzelnigg=plt.plot([5,6,7,8], [ 90863.3,90863.1,90863.7,90863.9], 'bs',markersize=15,label='$X^{3.5}$') # CBS 3.5
Martin=plt.plot([5,6,7,8], [ 90860.6,90860.9,90860.9,90862.8], 'g^',markersize=15,label='$(X+1/2)^4$') # CBS 4

plt.rc('text', usetex=True)
plt.rc('font', family='serif')

font={'family':'serif',
      'weight':'normal',
      'size':16,
     }

plt.xlabel(r'aug-cc-pCV$(X)$Z',fontsize=32,fontdict=font,labelpad=25)
plt.ylabel(r'Ionization Energy [cm$^{-1}$]',fontsize=32,fontdict=font,labelpad=25)

plt.xticks(fontsize=16, rotation=0)
plt.yticks(fontsize=16, rotation=0)
plt.xticks([4,5,6,7,8])

leg = plt.legend(prop={'size': 40})
#plt.legend(handles=[raw,Kutzelnigg,Martin])
plt.show()

