param($installPath, $toolsPath, $package, $project)

$path = [System.IO.Path]
$rootName = "gallery-sm-menu"
$galleryPath = $path::Combine($path::GetDirectoryName($project.FileName), "Scripts\yui3-gallery\build\$rootName")
$extension = ".js"
$archivePath = "$galleryPath\previous"

if (test-path -path $archivePath)
{
    foreach($fileSuffix in $extension, "-debug$extension", "-min$extension")
    {
        $fileName = "$rootName$fileSuffix"
        $filePath = "$archivePath\$fileName"

        if(test-path -path $filePath)
        {           
            move-item -force $filePath "$galleryPath\$fileName"
        }
    }

	if(test-path -path $archivePath)
	{
		remove-item $archivePath -force -recurse
	}
}