
TargetDir = getDirectory("C:/Users/ek18186/OneDrive - University of Bristol/Desktop/results/");

for(i = 0; i<= 5; i++) 
{
	
	
	{
	list3 = getFileList(SourceDir+list[i]+list2[j]);
		for(k =0; k<= 59; k++)
		{
		subdir = SourceDir + list[i] + list2[j] + list3[k];
		Myoperation(subdir);
		
		
	}
}


 {
	
	

	
imageCalculator("Subtract create stack", title,"AVG_"+title);
selectWindow("Result of "+title);
run("8-bit");
setAutoThreshold("Default dark");
//run("Threshold...");
	
	
selectWindow("Summary of Result of "+title);
saveAs("Results", TargetDir+title+'.csv');

close();
close();
close();

}