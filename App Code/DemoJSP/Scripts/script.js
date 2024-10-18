function MM_swapImgRestore() 
{
  if (document.MM_swapImgData != null)
   for (var i=0; i<(document.MM_swapImgData.length-1); i+=2)
     document.MM_swapImgData[i].src = document.MM_swapImgData[i+1];
}

function MM_preloadImages() 
{
  if (document.images) 
  {
    var imgFiles = MM_preloadImages.arguments;
    if (document.preloadArray==null) document.preloadArray = new Array();
    var i = document.preloadArray.length;
    with (document) for (var j=0; j<imgFiles.length; j++) if (imgFiles[j].charAt(0)!="#"){
    preloadArray[i] = new Image;
    preloadArray[i++].src = imgFiles[j];
  }
 }
}

function MM_swapImage() 
{
  var i,j=0,objStr,obj,swapArray=new Array,oldArray=document.MM_swapImgData;
  for (i=0; i < (MM_swapImage.arguments.length-2); i+=3)
  {
    objStr = MM_swapImage.arguments[(navigator.appName == 'Netscape')?i:i+1];
    if ((objStr.indexOf('document.layers[')==0 && document.layers==null) ||
        (objStr.indexOf('document.all[')   ==0 && document.all   ==null))
      objStr = 'document'+objStr.substring(objStr.lastIndexOf('.'),objStr.length);
      obj = eval(objStr);

    if (obj != null) 
	{
      swapArray[j++] = obj;
      swapArray[j++] = (oldArray==null || oldArray[j-1]!=obj)?obj.src:oldArray[j];
      obj.src = MM_swapImage.arguments[i+2];
    }
  }

  document.MM_swapImgData = swapArray; //used for restore
}

function MM_openBrWindow(theURL,winName,features) 
{
  var Win = window.open(theURL,winName,features);
}


function openBrWindow(theURL,winName,width,height,features) 
{ 
  var Win = window.open(theURL,winName,'width=' + width + ',height=' + height + ',' + features);
}


function openDemoWindow(theURL,winName) 
{
  openBrWindow(theURL, winName, '660', '500', 'toolbar=no,location=no,scrollbars=no,resizable=no,status=1');
}