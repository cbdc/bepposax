<resource schema="bepposax">
  <meta name="title">Bepposax</meta>
  <meta name="creationDate">2020-07-18T01:02:03</meta>
  <meta name="description">
      The Bepposax data spectrum.
  </meta>
  <meta name="creator.name">Paolo Giommi</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">X-ray sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">X-ray</meta>
  </meta>

  <meta name="source">
    2020 in preparation
  </meta>

  <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="Index">
    <index columns="RA,Dec"/>

    <column name="Index" type="integer"
        ucd="meta.id;meta.main"
        tablehead="Source index" verbLevel="1"
        description="Source index"
        required="True"/>

    <column name="RA" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="RA" verbLevel="1"
      description="Right ascension (J2000) of the object"
      required="True"/>

    <column name="Dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec" verbLevel="1"
      description="Declination (J2000) of the object"
      required="True"/>

    <column name="Freq" type="real"
      unit="Hz" ucd="em.freq"
      tablehead="Frequency" verbLevel="1"
      description="Frequency"
      required="True"/>

    <column name="Freq_err" type="real"
      unit="Hz" ucd="stat.error;em.freq"
      tablehead="Frequency_err" verbLevel="1"
      description="Frequency error"
      required="True"/>

    <column name="Flux" type="real"
      unit="erg sec-1 cm-2" ucd="phot.flux.density;em.X-ray"
      tablehead="Flux" verbLevel="1"
      description="Flux"
      required="True"/>

    <column name="Flux_err" type="real"
      unit="erg sec-1 cm-2" ucd="stat.error;phot.flux.density;em.X-ray"
      tablehead="Flux_err" verbLevel="1"
      description="Flux error"
      required="True"/>

    <column name="MJD_start" type="double precision"
      unit="MJD" ucd="time.start"
      tablehead="Start_time" verbLevel="1"
      description="observation start time"
      required="True"/>

    <column name="MJD_end" type="double precision"
      unit="MJD" ucd="time.end"
      tablehead="End_time" verbLevel="1"
      description="observation end time"
      required="True"/>


  </table>

  <data id="import">
    <sources>bepposax.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">Bepposax Spectral Data</meta>
    <meta name="shortName">bepposax cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <!--publish render="scs.xml" sets="ivo_managed"/-->
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>
