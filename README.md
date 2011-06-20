This is a rough example on how I implemented html5 video.
Adapt this utility to your needs, In this specific case I am using the [videojs player](http://videojs.com/) Script. 

Example Setup:

 - create a video section
 - create uploadfields for video files (mp4, webm, ogg, flv)
 - create an uploadfield named 'poster
 - create a selectbox for choosing the video player's skin. Name it 'skin' and set values to 'default, tube, vim, hu'

in our xsl do something like:

		<xsl:call-template name="videojs">
			<xsl:with-param name="videoWidth" select="'778'" />
			<xsl:with-param name="videoHeight" select="'438'" />
			<xsl:with-param name="source" select="." />
			<xsl:with-param name="showDownloadLink" select="true()" />
		</xsl:call-template>

where param source ('.') should point to your 'video/entry' xpath



(example for backend view, using Nick Dunns HTML panel field extension)

![](https://github.com/iwyg/videojs-utility/raw/master/doc/videojs_be.png)



