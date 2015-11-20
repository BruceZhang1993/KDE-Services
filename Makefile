#################################################################
# Installing KDE-Services, to appropriate directories.		#
# Author: Geovani Barzaga Rodriguez <igeo.cu@gmail.com>.	#
# KDE-Services 2011-2015. GPLv3+				#
#################################################################

PREFIXmenu5=$(RPM_BUILD_ROOT)/usr/share/kservices5/ServiceMenus
PREFIXservicetypes5=$(RPM_BUILD_ROOT)/usr/share/kservicetypes5
PREFIXmenu=$(RPM_BUILD_ROOT)/usr/share/kde4/services/ServiceMenus
PREFIXapp=$(RPM_BUILD_ROOT)/usr/share/applications
PREFIX512apps=$(RPM_BUILD_ROOT)/usr/share/icons/hicolor/512x512/apps
PREFIXmime=$(RPM_BUILD_ROOT)/usr/share/mime/text
PREFIXappmerge=$(RPM_BUILD_ROOT)/etc/xdg/menus/applications-merged
PREFIXdeskdir=$(RPM_BUILD_ROOT)/usr/share/desktop-directories
PREFIXdoc=$(RPM_BUILD_ROOT)/usr/share/doc/kde-services

install:
	mkdir -p $(PREFIXmenu5)
	mkdir -p $(PREFIXservicetypes5)
	mkdir -p $(PREFIXmenu)
	mkdir -p $(PREFIXapp)
	mkdir -p $(PREFIX512apps)
	mkdir -p $(PREFIXmime)
	mkdir -p $(PREFIXappmerge)
	mkdir -p $(PREFIXdeskdir)
	mkdir -p $(PREFIXdoc)
	
	cp ServiceMenus/* $(PREFIXmenu5)
	cp servicetypes/* $(PREFIXservicetypes5)
	cp ServiceMenus/* $(PREFIXmenu)
	cp applications/* $(PREFIXapp)
	cp 512x512/apps/* $(PREFIX512apps)
	cp mime/text/* $(PREFIXmime)
	cp applications-merged/* $(PREFIXappmerge)
	cp desktop-directories/* $(PREFIXdeskdir)
	cp doc/* $(PREFIXdoc)

	xdg-mime install --mode system --novendor $(PREFIXmime)/kde-services.xml
	update-mime-database /usr/share/mime > /dev/null
	xdg-icon-resource forceupdate --theme hicolor
	xdg-desktop-menu forceupdate

uninstall:
	rm -f $(PREFIXmenu5)/Add-Timestamp-Prefix_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Android-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Audio-Video-Info_addtoservicemenu.desktop \
		$(PREFIXmenu5)/AVI-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Backup-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Change-Owner_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Change-Timestamp_addtoservicemenu.desktop \
		$(PREFIXmenu5)/CheckSum-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Compressed-File-Integrity-Check_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Dolphin-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Dropbox-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Graphic-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/ISO-Image-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Midnight-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/MKV-Extract-Subtitle_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Multimedia-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Multiplex-Subtitle_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Name-Whitespace-Replace_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Network-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Package-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/PDF-Tools2_servicemenu.desktop \
		$(PREFIXmenu5)/PDF-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/SaMBa-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Search-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Security-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Send-By-Email_addtoservicemenu.desktop \
		$(PREFIXmenu5)/Show-Status_addtoservicemenu.desktop \
		$(PREFIXmenu5)/SSH-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/System-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Terminal-Tools_servicemenu.desktop \
		$(PREFIXmenu5)/Text-Replace_addtoservicemenu.desktop \
		$(PREFIXmenu5)/YouTube-Tools_servicemenu.desktop

	rm -f $(PREFIXservicetypes5)/konqpopupmenuplugin.desktop

	rm -f $(PREFIXmenu)/Add-Timestamp-Prefix_addtoservicemenu.desktop \
		$(PREFIXmenu)/Android-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Audio-Video-Info_addtoservicemenu.desktop \
		$(PREFIXmenu)/AVI-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Backup-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Change-Owner_addtoservicemenu.desktop \
		$(PREFIXmenu)/Change-Timestamp_addtoservicemenu.desktop \
		$(PREFIXmenu)/CheckSum-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Compressed-File-Integrity-Check_addtoservicemenu.desktop \
		$(PREFIXmenu)/Dolphin-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Dropbox-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Graphic-Tools_servicemenu.desktop \
		$(PREFIXmenu)/ISO-Image-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Midnight-Tools_servicemenu.desktop \
		$(PREFIXmenu)/MKV-Extract-Subtitle_addtoservicemenu.desktop \
		$(PREFIXmenu)/Multimedia-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Multiplex-Subtitle_addtoservicemenu.desktop \
		$(PREFIXmenu)/Name-Whitespace-Replace_addtoservicemenu.desktop \
		$(PREFIXmenu)/Network-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Package-Tools_servicemenu.desktop \
		$(PREFIXmenu)/PDF-Tools2_servicemenu.desktop \
		$(PREFIXmenu)/PDF-Tools_servicemenu.desktop \
		$(PREFIXmenu)/SaMBa-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Search-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Security-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Send-By-Email_addtoservicemenu.desktop \
		$(PREFIXmenu)/Show-Status_addtoservicemenu.desktop \
		$(PREFIXmenu)/SSH-Tools_servicemenu.desktop \
		$(PREFIXmenu)/System-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Terminal-Tools_servicemenu.desktop \
		$(PREFIXmenu)/Text-Replace_addtoservicemenu.desktop \
		$(PREFIXmenu)/YouTube-Tools_servicemenu.desktop

	rm -f $(PREFIXapp)/About_KDE-Services.desktop \
		$(PREFIXapp)/About_KDE-Services.sh \
		$(PREFIXapp)/Android_Tools-apk-manager.desktop \
		$(PREFIXapp)/Android_Tools-apk-manager.sh \
		$(PREFIXapp)/Android_Tools-backup-restore.desktop \
		$(PREFIXapp)/Android_Tools-backup-restore.sh \
		$(PREFIXapp)/Android_Tools-push-pull.desktop \
		$(PREFIXapp)/Android_Tools-push-pull.sh \
		$(PREFIXapp)/Android_Tools-reboot.desktop \
		$(PREFIXapp)/Android_Tools-reboot.sh \
		$(PREFIXapp)/AVI_Tools-avi-split-size.sh \
		$(PREFIXapp)/AVI_Tools-avi-split-time.sh \
		$(PREFIXapp)/Backup_Tools-standard.desktop \
		$(PREFIXapp)/Backup_Tools-standard.sh \
		$(PREFIXapp)/Change_file-dir_timestamp.sh \
		$(PREFIXapp)/CheckSum_Tools-verify-checksum.sh \
		$(PREFIXapp)/Compressed_file_integrity_check.sh \
		$(PREFIXapp)/DiskCloner.sh \
		$(PREFIXapp)/Dolphin_Tools-change-owner.sh \
		$(PREFIXapp)/Dolphin_Tools-connect.desktop \
		$(PREFIXapp)/Dolphin_Tools-connect.sh \
		$(PREFIXapp)/Dolphin_Tools-disk-use.sh \
		$(PREFIXapp)/Dolphin_Tools-name-whitespace-replace.sh \
		$(PREFIXapp)/Dropbox_Tools-frontend.py \
		$(PREFIXapp)/Dropbox_Tools-frontend.pyc \
		$(PREFIXapp)/Dropbox_Tools-frontend.pyo \
		$(PREFIXapp)/Dropbox_Tools-main.sh \
		$(PREFIXapp)/Dropbox_Tools-service-autostart.desktop \
		$(PREFIXapp)/Dropbox_Tools-service-install.desktop \
		$(PREFIXapp)/Dropbox_Tools-service-start.desktop \
		$(PREFIXapp)/Dropbox_Tools-service-stop.desktop \
		$(PREFIXapp)/Dropbox_Tools-service-update.desktop \
		$(PREFIXapp)/DVD_Tools-d.v.d.-assembler.desktop \
		$(PREFIXapp)/DVD_Tools-d.v.d.-assembler.sh \
		$(PREFIXapp)/ffmpeg_multifile-convert-video.sh \
		$(PREFIXapp)/ffmpeg_multifile-extract-audio.sh \
		$(PREFIXapp)/ffmpeg_record-my-desktop.sh \
		$(PREFIXapp)/Graphic_Tools-the-converter.desktop \
		$(PREFIXapp)/Graphic_Tools-the-sizer.desktop \
		$(PREFIXapp)/HTTP_Publisher.sh \
		$(PREFIXapp)/iso_manager-burn-image.sh \
		$(PREFIXapp)/iso_manager-mount-image.sh \
		$(PREFIXapp)/Midnight_Tools-mc.desktop \
		$(PREFIXapp)/Midnight_Tools-mc-root.desktop \
		$(PREFIXapp)/MKV_Extract-subtitle.sh \
		$(PREFIXapp)/Multimedia_Tools-convert-video.desktop \
		$(PREFIXapp)/Multimedia_Tools-diskcloner.desktop \
		$(PREFIXapp)/Multimedia_Tools-extract-audio.desktop \
		$(PREFIXapp)/Multimedia_Tools-record-my-desktop.desktop \
		$(PREFIXapp)/Multiplex_Subtitle.sh \
		$(PREFIXapp)/Network_Tools-connect-sentry.desktop \
		$(PREFIXapp)/Network_Tools-connect-sentry.sh \
		$(PREFIXapp)/Network_Tools-listening-sockets.desktop \
		$(PREFIXapp)/Network_Tools-listening-sockets.sh \
		$(PREFIXapp)/PDFktools.sh \
		$(PREFIXapp)/SaMBa_Tools-mount-umount-share.desktop \
		$(PREFIXapp)/SaMBa_Tools-mount-umount-share.sh \
		$(PREFIXapp)/Search_Tools-modified-files-here.sh \
		$(PREFIXapp)/Search_Tools-search-by-name.desktop \
		$(PREFIXapp)/Search_Tools-search-by-name.sh \
		$(PREFIXapp)/Search_Tools-search-by-string.sh \
		$(PREFIXapp)/Search_Tools-search-here.sh \
		$(PREFIXapp)/Search_Tools-statistics-search-db.desktop \
		$(PREFIXapp)/Search_Tools-statistics-search-db.sh \
		$(PREFIXapp)/Search_Tools-update-search-db.desktop \
		$(PREFIXapp)/Search_Tools-update-search-db.sh \
		$(PREFIXapp)/Show_file-dir_status.sh \
		$(PREFIXapp)/SSH_Tools-connect-remote-machine.desktop \
		$(PREFIXapp)/SSH_Tools-connect.sh \
		$(PREFIXapp)/SSH_Tools-copy-id.sh \
		$(PREFIXapp)/SSH_Tools-install-public-key.desktop \
		$(PREFIXapp)/SSH_Tools-keygen.desktop \
		$(PREFIXapp)/SSH_Tools-register-machine.desktop \
		$(PREFIXapp)/SSH_Tools-register-machine.sh \
		$(PREFIXapp)/SSH_Tools-scp.sh \
		$(PREFIXapp)/SSH_Tools-ssh-keygen.sh \
		$(PREFIXapp)/SSH_Tools-sshfs.desktop \
		$(PREFIXapp)/SSH_Tools-sshfs.sh \
		$(PREFIXapp)/System_Tools-build-custom-kernel.desktop \
		$(PREFIXapp)/System_Tools-build-custom-kernel.sh \
		$(PREFIXapp)/System_Tools-check-kernel-update.desktop \
		$(PREFIXapp)/System_Tools-check-kernel-update.sh \
		$(PREFIXapp)/System_Tools-process-viewer.desktop \
		$(PREFIXapp)/System_Tools-process-viewer.sh \
		$(PREFIXapp)/System_Tools-rebuild-package.desktop \
		$(PREFIXapp)/System_Tools-rebuild-package.sh \
		$(PREFIXapp)/System_Tools-sys-info.desktop \
		$(PREFIXapp)/System_Tools-sys-info.sh \
		$(PREFIXapp)/System_Tools-system-monitor.desktop \
		$(PREFIXapp)/System_Tools-system-monitor.sh \
		$(PREFIXapp)/System_Tools-Xorg-configure.desktop \
		$(PREFIXapp)/System_Tools-Xorg-configure.sh \
		$(PREFIXapp)/The_Converter.sh \
		$(PREFIXapp)/The_Sizer.sh \
		$(PREFIXapp)/YouTube_Tools-download-video.desktop \
		$(PREFIXapp)/YouTube_Tools-download-video.sh \
		$(PREFIXapp)/YouTube_Tools-video-code-collector.desktop \
		$(PREFIXapp)/YouTube_Tools-video-code-collector.sh

	rm -f $(PREFIX512apps)/ks-android-apk-manager.png \
		$(PREFIX512apps)/ks-android-backup-restore.png \
		$(PREFIX512apps)/ks-android-push-pull.png \
		$(PREFIX512apps)/ks-android-reboot.png \
		$(PREFIX512apps)/ks-audio-video-info.png \
		$(PREFIX512apps)/ks-audio.png \
		$(PREFIX512apps)/ks-checksum.png \
		$(PREFIX512apps)/ks-clock.png \
		$(PREFIX512apps)/ks-compressed-file.png \
		$(PREFIX512apps)/ks-connect-to.png \
		$(PREFIX512apps)/ks-database.png \
		$(PREFIX512apps)/ks-decrypt.png \
		$(PREFIX512apps)/ks-disk-space-used.png \
		$(PREFIX512apps)/ks-dolphin-file-manager.png \
		$(PREFIX512apps)/ks-dropbox-off.png \
		$(PREFIX512apps)/ks-dropbox-on.png \
		$(PREFIX512apps)/ks-dropbox.png \
		$(PREFIX512apps)/ks-encrypt.png \
		$(PREFIX512apps)/ks-error.png \
		$(PREFIX512apps)/ks-extracting-subs.png \
		$(PREFIX512apps)/ks-folder-public-web.png \
		$(PREFIX512apps)/ks-folder-remote.png \
		$(PREFIX512apps)/ks-hwinfo.png \
		$(PREFIX512apps)/ks-image.png \
		$(PREFIX512apps)/ks-info.png \
		$(PREFIX512apps)/ks-kernel-rebuild.png \
		$(PREFIX512apps)/ks-kernel-update.png \
		$(PREFIX512apps)/ks-key.png \
		$(PREFIX512apps)/ks-keygen.png \
		$(PREFIX512apps)/ks-mc-root.png \
		$(PREFIX512apps)/ks-mc-user.png \
		$(PREFIX512apps)/ks-mcedit-root.png \
		$(PREFIX512apps)/ks-mcedit-user.png \
		$(PREFIX512apps)/ks-media-optical-burn.png \
		$(PREFIX512apps)/ks-media-optical-clone.png \
		$(PREFIX512apps)/ks-media-optical-integrity-check.png \
		$(PREFIX512apps)/ks-media-optical-md5sum.png \
		$(PREFIX512apps)/ks-media-optical-mount.png \
		$(PREFIX512apps)/ks-media-optical-umount.png \
		$(PREFIX512apps)/ks-media-optical-video.png \
		$(PREFIX512apps)/ks-media-tape.png \
		$(PREFIX512apps)/ks-menu.png \
		$(PREFIX512apps)/ks-multiplexing-subs.png \
		$(PREFIX512apps)/ks-owner.png \
		$(PREFIX512apps)/ks-pdf.png \
		$(PREFIX512apps)/ks-rebuild-rpm.png \
		$(PREFIX512apps)/ks-resize-image.png \
		$(PREFIX512apps)/ks-search-database-update.png \
		$(PREFIX512apps)/ks-search-name.png \
		$(PREFIX512apps)/ks-search-replace.png \
		$(PREFIX512apps)/ks-search-stats.png \
		$(PREFIX512apps)/ks-search-string.png \
		$(PREFIX512apps)/ks-secure-mail.png \
		$(PREFIX512apps)/ks-sentry-off.png \
		$(PREFIX512apps)/ks-sentry-on.png \
		$(PREFIX512apps)/ks-sentry-warning.png \
		$(PREFIX512apps)/ks-server.png \
		$(PREFIX512apps)/ks-shellscript.png \
		$(PREFIX512apps)/ks-shredder.png \
		$(PREFIX512apps)/ks-smbfs.png \
		$(PREFIX512apps)/ks-socket.png \
		$(PREFIX512apps)/ks-sshfs.png \
		$(PREFIX512apps)/ks-system-process.png \
		$(PREFIX512apps)/ks-terminal.png \
		$(PREFIX512apps)/ks-text-plain.png \
		$(PREFIX512apps)/ks-video.png \
		$(PREFIX512apps)/ks-warning.png \
		$(PREFIX512apps)/ks-whitespace-replace.png \
		$(PREFIX512apps)/ks-xorg.png \
		$(PREFIX512apps)/ks-youtube-download-video.png \
		$(PREFIX512apps)/ks-youtube-video-code-collector.png

	rm -f $(PREFIXmime)/kde-services.xml \
		/usr/share/mime/packages/kde-services.xml

	rm -f $(PREFIXappmerge)/kde-services.menu

	rm -f $(PREFIXdeskdir)/KDE-Services.directory \
		$(PREFIXdeskdir)/KDE-Services_Android-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Backup-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Dolphin-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Dropbox-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Graphic-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Midnight-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Multimedia-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Network-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_SaMBa-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_Search-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_SSH-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_System-Tools.directory \
		$(PREFIXdeskdir)/KDE-Services_YouTube-Tools.directory

	rm -fr $(PREFIXdoc)

	update-mime-database /usr/share/mime > /dev/null
	xdg-icon-resource forceupdate --theme hicolor
	xdg-desktop-menu forceupdate

