<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:template name="videojs">
		
		<xsl:param name="videoWidth"/>
		<xsl:param name="videoHeight"/>
		<xsl:param name="posterSource"/>		

		<xsl:param name="showDownloadLink" select="true()"/>
		<xsl:param name="source"/>
		
		<xsl:variable name="poster">
			<xsl:if test="$source/poster">
				<xsl:value-of select="concat($workspace,$source/poster/@path,'/',$source/poster/filename)"/> 
			</xsl:if>				
		</xsl:variable>
		<xsl:variable name="mp4">
			<xsl:if test="$source/mp4">
				<xsl:value-of select="concat($workspace,$source/mp4/@path,'/',$source/mp4/filename)"/> 
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="webm">
			<xsl:if test="$source/webm">
				<xsl:value-of select="concat($workspace,$source/webm/@path,'/',$source/webm/filename)"/> 
			</xsl:if>	
		</xsl:variable>
		<xsl:variable name="ogg">
			<xsl:if test="$source/ogg">
				<xsl:value-of select="concat($workspace,$source/ogg/@path,'/',$source/ogg/filename)"/> 
			</xsl:if>
		</xsl:variable>			
		<xsl:variable name="flv">
			<xsl:if test="$source/flv">
				<xsl:value-of select="concat($workspace,$source/flv/@path,'/',$source/flv/filename)"/> 
			</xsl:if>
		</xsl:variable>
		
		
		<div>
			<xsl:attribute name="class">
				<xsl:value-of select="'video-js-box'"/>
				<xsl:if test="$source/skin">
					<xsl:value-of select="concat(' ',$source/skin,'-css')"/>
				</xsl:if>
			</xsl:attribute>
		<!-- Using the Video for Everybody Embed Code http://camendesign.com/code/video_for_everybody -->
			<video class="video-js" width="{$videoWidth}" height="{$videoHeight}" controls="" preload="" poster="{$poster}" >
				<xsl:if test="$source/mp4">
					<source src="{$mp4}" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
				</xsl:if>
				<xsl:if test="$source/webm">
					<source src="{$webm}" type='video/webm; codecs="vp8, vorbis"' />
				</xsl:if>
				<xsl:if test="$source/ogg">
					<source src="{$ogg}" type='video/ogg; codecs="theora, vorbis"' />
				</xsl:if>
				<!-- Flash Fallback. Use any flash video player here. Make sure to keep the vjs-flash-fallback class. -->
				<xsl:if test="$source/flv or $source/mp4">
					<xsl:variable name="flashvideo">
						<xsl:choose>
							<xsl:when test="$source/flv">
								<xsl:value-of select="$flv"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$mp4"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<object class="vjs-flash-fallback" width="{$videoWidth}" height="{$videoHeight}" type="application/x-shockwave-flash"
						data="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf">
						<param name="movie" value="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" />
						<param name="allowfullscreen" value="true" />
						<xsl:variable name="flashvars"><![CDATA[config={"playlist":["]]><xsl:value-of select="$poster" /><![CDATA[", {"url": "]]><xsl:value-of select="$flashvideo" /><![CDATA[","autoPlay":false,"autoBuffering":true}]}]]></xsl:variable>
							

						<param name="flashvars" value='{$flashvars}' />
					<!-- Image Fallback. Typically the same as the poster image. -->
						<img src="http://video-js.zencoder.com/oceans-clip.png" width="{$videoWidth}" height="{$videoHeight}" alt="Poster Image"
						title="No video playback capabilities." />
					</object>
				</xsl:if>
			</video>
		    <!-- Download links provided for devices that can't play video in the browser. -->
			<xsl:if test="$showDownloadLink = true()" >
				<xsl:if test="$source/mp4 or $source/webm or $source/ogg">				
					<p class="vjs-no-video"><strong>Download Video:</strong>
						<xsl:if test="$source/mp4">
							<a href="{$workspace}/{$source/mp4/@path}/{$source/mp4/filename}">MP4 <xsl:value-of select="concat('(',$source/mp4/@size,')')"/></a>,
						</xsl:if>		
						<xsl:if test="$source/webm">						
							<a href="{$workspace}/{$source/webm/@path}/{$source/webm/filename}">WebM <xsl:value-of select="concat('(',$source/webm/@size,')')"/></a>,
						</xsl:if>	
						<xsl:if test="$source/ogg">					
							<a href="{$workspace}/{$source/ogg/@path}/{$source/ogg/filename}">Ogg <xsl:value-of select="concat('(',$source/ogg/@size,')')"/></a><br/>
						</xsl:if>	
						<!-- Support VideoJS by keeping this link. -->
						<a href="http://videojs.com">HTML5 Video Player</a> by VideoJS
					</p>
				</xsl:if>	
			</xsl:if>
		</div>
  </xsl:template>
</xsl:stylesheet>

