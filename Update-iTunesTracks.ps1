function Update-iTunesTracks {
	<#
	.SYNOPSIS
	Reloads track metadata from files and removes entries for missing tracks
	.DESCRIPTION
	This function reads the iTunes libray to find all the tracks and checks whether the file exists.
	If the file exists the ID3 tags are read and the track information is updated.  If the file does 
	not exist the track is removed from the iTunes library.
  #>

	$iTunes = new-Object -comobject iTunes.Application
	if($iTunes -ne $null) {
		'iTunes started.' | out-Host
		1..$iTunes.LibraryPlaylist.Tracks.Count | % {
			$CurrentTrack = $ITunes.LibraryPlaylist.Tracks.Item($_)
			if ( $CurrentTrack.Kind -eq 1 ) {
				if ( ! ([System.IO.File]::Exists($CurrentTrack.Location)) ) {
					Write-Progress -activity "deleting entry for missing track, " -status "$($CurrentTrack.Artist) - $($CurrentTrack.Name)" -percentComplete ( $_/$ITunes.LibraryPlaylist.Tracks.Count*100)
					$CurrentTrack.Delete()
				}
				else {
					Write-Progress -activity "updating id3 tag information for, " -status "$($CurrentTrack.Artist) - $($CurrentTrack.Name)" -percentComplete ( $_/$ITunes.LibraryPlaylist.Tracks.Count*100)
					$CurrentTrack.UpdateInfoFromFile()
				}
			}
	}
    start-Sleep (30)
    'Shutting down iTunes' | out-Host
    $iTunes.Quit()
    $iTunes = $null }
}
