<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- *********************************************************** -->
    <!-- Version 1-2020-05-04                                        -->
    <!-- Le script suivant à été développé dans le cadre pédagogique -->
    <!-- du cours d'XML-TEI/XSLT du master Technologies numériques   -->
    <!-- appliquées à l'histoire de l'Ecole nationale des chartes    -->
    <!-- http://www.chartes.psl.eu/                                  -->
    <!-- *********************************************************** -->
    <!--          Des Questions ?                                    -->
    <!-- Lucas TERRIEL (@LucaTerre - Github)                         -->
    <!-- *********************************************************** -->
    <!-- Ce script est libre à la réutilisation selon les termes     -->
    <!-- de la Creative Commons Attribution license.                 -->
    <!-- *********************************************************** -->
  
    <xsl:output 
        method="html" 
        indent="yes" 
        encoding="UTF-8"
    />

    <!-- Pour la gestion des espaces -->

    <xsl:strip-space elements="*"/>
    
    <!-- TEMPLATE PRINCIPALE : Canevas HTML one-page -->

    <xsl:template match="/">

        <!-- déclaration des variables utiles -->

        <xsl:variable name="title" select="descendant::titleStmt/title[@type = 'main_title']/text()"/>
        
        <xsl:variable name="subtitle"
            select="descendant::titleStmt/title[@type = 'subtitle']/text()"/>
        
        <!-- ** Ici, on crée des variables pour les régles de sortie; l'édition n'est composé que d'une seule page dans le projet initial
        mais au cas où l'on souhaiterai faire évoluer l'édition, nous laissons la possibilité de rajouter des pages-->
        
        <!-- ** Récupération du chemin du fichier courant -->
        
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(vieDeStGilles-TEI),'.xml','')"/>
        </xsl:variable>
        
        <!-- ** Chemin vers l'unique page web -->
        
        <xsl:variable name="main_path">
            <xsl:value-of select="concat($witfile, 'edition-numerique', '.html')"/>
        </xsl:variable>
     
        <!-- ** HTML:HEAD ** -->
        
            <xsl:variable name="head">
            <head>
                <meta charset="UTF-8"/>
                <meta name="description">
                    <xsl:attribute name="content"
                        select="normalize-space(descendant::publicationStmt/p)"/>
                </meta>
                <meta name="keywords"
                    content="édition numérique, XML, Text Encoding Initiative, Vie de saint Gilles, Wauchier de Denain, master TNAH, Ecole des Chartes"/>
                <meta name="author" content="Lucas Terriel"/>
                <meta name="viewport"
                    content="width-device-with, initial-scale-1.0, maximum-scale-1.0, minimal-ui"/>

                <title>Edition XML-TEI de <xsl:value-of select="concat($title, ' - ', $subtitle)"
                    /></title>

                <!-- Lien vers CDN, CSS et Fonts -->

                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
                    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
                    crossorigin="anonymous"/>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css?family=Almendra+SC|Roboto"/>
                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"/>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"/>

                <!-- Matériel CSS add-ons -->

                <style>
                    /** Style général **/
                    
                    .part_header {
                        background-color: #7b241c;
                    }
                    
                    .font-header {
                        font-family: 'MedievalSharp', cursive;
                    }
                    
                    .titre_head {
                        font-family: 'Almendra SC', serif;
                        font-size: 70px;
                    }
                    
                    .vertical-line {
                        border-left: 2px solid #000;
                        display: inline-block;
                        height: 20px;
                        margin: 0 20px;
                    }
                    
                    .menu_header {
                        padding: 20px 20px 20px 20px;
                        position: relative;
                        margin-left: 270px;
                        text-align: justify;
                        font-family: 'Roboto', sans-serif;
                    }
                    
                    .page-footer {
                        display: flow-root;
                    }
                    
                    .footer-copyright {
                        font-family: 'Roboto', sans-serif;
                    }
                    
                    .titre_div {
                        font-family: 'Almendra SC', serif;
                    }
                    
                    .scroll-div {
                        overflow: auto;
                        height: 550pt;
                        width: 295pt;
                        background-color: #DEB887;
                        padding: 15px;
                        text-align: justify;
                        border: 2.5px solid black;
                        font-size: 15px;
                    }
                    
                    .img-fluide {
                        padding: 1px 3px 4px 5px;
                        margin-left: 13px;
                    }
                    
                    .edition_centre {
                        padding: 0 0 0 86px;
                    }
                    
                    
                    /* Style pour le hr Shine */
                    
                    .shine {
                        height: 20px;
                        width: 60%;
                        background-image: radial-gradient(
                    farthest-side at 50% -50%, 
                    hsla(0, 0%, 0%, 0.5), 
                    hsla(0, 0%, 0%, 0));
                        position: relative;
                    }
                    
                    .shine::before {
                        height: 1px;
                        position: absolute;
                        top: -1px;
                        left: 0;
                        right: 0;
                        background-image: linear-gradient(
                    90deg, 
                    hsla(0, 0%, 0%, 0), 
                    hsla(0, 0%, 0%, 0.75) 50%, 
                    hsla(0, 0%, 0%, 0));
                    }</style>
                <style>
                    
                    /** Style pour facsimilé interactif **/
                    
                    
                    h1 {
                    text-align: center;
                    }
                    
                    .tabs {
                    overflow: auto;
                    border: 1px solid darkgrey;
                    background-color: gainsboro;
                    margin:5px 240px;
                    }
                    
                    .tabs button {
                    background-color: inherit;
                    padding: 0.5em;
                    float: left;
                    border: none;
                    outline: none;
                    cursor: pointer;
                    transition: 0.3s;
                    font-size: 1em;
                    }
                    
                    .tabs button:hover {
                    background-color: silver;
                    }
                    
                    .tabs button.active {
                    background-color: darkgrey;
                    }
                    
                    .section-wrapper {
                    position: relative;
                    padding: 10px 0px 0px 240px;
      
                    }
                    
                    div.zone {
                    position: absolute;
                    }
                    
                    div.zone &gt; span {
                    position: relative;
                    display: block;
                    overflow-y: auto;
                    visibility: hidden;
                    background-color: white;
                    font-family: Georgia, serif;
                    padding: 0px 5px;
                    }
                    
                    .zone:hover span {
                    visibility: visible;
                    }
                    
                    /* version originale (ov) */
                    .ov {
                    color: crimson;
                    }
                    
                    /* version régularisée (rv) */
                    .rv {
                    color: mediumseagreen;
                    }
                    
                    /* Not shown (ns) */
                    .ns {
                    display: none;
                    }
                    
                </style>
            </head>
            </xsl:variable>
        
        <!-- ** HTML:BODY ** -->
        
        <xsl:variable name="body">
            <body>
                
                <!-- *** jumbotron de présentation -->
                
                <div class="jumbotron jumbotron-fluid part_header">
                    <div class="container">
                        <h1 class="titre_head">
                            <xsl:value-of select="concat($title, ' - ', $subtitle)"/>
                        </h1>
                        <br/>
                        <br/>
                        <hr class="shine"/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        
                        <!-- *** menu navbar -->
                        
                        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item">
                                        <a class="nav-link " href="#metadonnees">Description du
                                            manuscrit</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#facsimile">Facsimilé
                                            interactif</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#edition">Edition allographétique
                                            et régularisée</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>

                <!-- *** partie métadonnées -->

                <div class="container">
                    <div class="div-acceuil reveal" id="metadonnees">
                        <br/>
                        <h3 class="titre_div">Métadonnées</h3>
                        <hr/>
                        <xsl:apply-templates select="descendant::sourceDesc"/>
                        <br/>
                        <br/>
                        <br/>
                    </div>
                </div>

                <!-- *** partie facsimile interactif -->

                <div class="container" id="facsimile">
                    <h3 class="titre_div">Fac-similé intéractif</h3>
                    <hr/>
                    <p>
                        <a>
                            <xsl:attribute name="href"
                                select="descendant::surrogates/bibl/title/@facs"/>
                            <xsl:attribute name="target">
                                <xsl:text>_blank</xsl:text>
                            </xsl:attribute>
                            <xsl:value-of select="descendant::surrogates/bibl/title"/>
                        </a>
                    </p>
                </div>
                <xsl:apply-templates select="descendant::facsimile"/>
                
                <!-- *** partie transcription régularisée et allographétique-->
                
                <div class="container" id="edition">
                    <div class="div-acceuil reveal">
                        <br/>
                        <h3 class="titre_div">Edition normalisée et allographétique</h3>
                        <hr/>
                        <br/>
                        <br/>
                        <br/>
                        <div class="container">
                            <div class="row">
                                <div class="edition_centre">
                                    <div class="col-sm">

                                        <!-- **** Version régularisée -->
                                        
                                        <h4 class="titre_div">Version régularisée</h4>
                                        <div class="scroll-div">
                                            <xsl:apply-templates select="descendant::text/body/div/div/p[@n]" mode="graphNormalize"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="edition_centre">
                                    <div class="col-sm">

                                        <!-- **** Version allographétique -->
                                        
                                        <h4 class="titre_div">Version allographétique</h4>
                                        <div class="scroll-div">
                                            <xsl:apply-templates select="descendant::text/body/div/div/p[@n]" mode="graphOriginal"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- *** Accès à la source XML et à la spécification ODD-->
                
                <div class="container">
                    <br/>
                    <br/>
                    <div class="col-sm">
                        <a href="./vieDeStGilles-TEI.xml"
                            class="btn btn-primary" role="button" aria-pressed="true" target="_blank">Source
                            XML-TEI</a>
                    </div>
                    <br/>
                    <div class="col-sm">
                        <a href="./odd-saint-Gilles.html" class="btn btn-primary" role="button"
                            aria-pressed="true" target="_blank">Accéder à l'ODD</a>
                    </div>
                </div>

                <!-- *** footer -->

                <footer class="page-footer">
                    <br/>
                    <br/>
                    <div class="footer-copyright text-center py-3">
                        <p>
                            <xsl:value-of select="concat(normalize-space(substring-after(upper-case(descendant::encodingDesc/projectDesc), '411')), ', prom. 2020')" />
                        </p>
                        <a href="http://www.chartes.psl.eu/fr" target="_blank">
                            <img src="./images/logo-ENC.png" alt="logo Ecole nationale des chartes" title="Ecole nationale des chartes" width="90"/>
                        </a>
                        <a href="https://github.com/Lucaterre/Edition-numerique_StGilles_XMLTEI.git" target="_blank">
                            <img width="60" src="./images/GitHub-Mark-120px-plus.png" title="Fork me on GITHUB !" class="img-fluide" alt="Fork me on GitHub" data-recalc-dims="1"/>
                        </a>
                        <a href="https://tei-c.org/guidelines/" target="_blank">
                            <img src="images/TEI-logo.png" width="60" title="Guidelines TEI P5" alt="Guidelines TEI P5" class="img-fluide"/>
                        </a>
                    </div>
                </footer>
                
                <!-- SCRIPTS JS -->
                
                <!-- **fac-similé intéractif -->
                
                <script type="text/javascript">
                    function changeVersion(e, ver) {
                    var ovnodes = document.getElementsByClassName("ov");
                    var rvnodes = document.getElementsByClassName("rv");
                    if (ver === "ov") {
                    for (var i = 0; i &lt; ovnodes.length; i++) {
                    var el = ovnodes[i];
                    el.style.display = "inline";
                    }
                    for (var i = 0; i &lt; rvnodes.length; i++) {
                    var el = rvnodes[i];
                    el.style.display = "none";
                    }
                    } else if (ver === "rv") {
                    for (var i = 0; i &lt; ovnodes.length; i++) {
                    var el = ovnodes[i];
                    el.style.display = "none";
                    }
                    for (var i = 0; i &lt; rvnodes.length; i++) {
                    var el = rvnodes[i];
                    el.style.display = "inline";
                    }
                    }
                    var btnVersions = document.querySelectorAll("#tabs-versions button");
                    for (var i = 0; i &lt; btnVersions.length; i++) {
                    var el = btnVersions[i];
                    el.className = el.className.replace(" active", "");
                    }
                    e.currentTarget.className += " active";
                    }
                    
                    function changeSection(e, sec) {
                    var sections = document.getElementsByClassName("section-wrapper");
                    for (var i = 0; i &lt; sections.length; i++) {
                    var el = sections[i];
                    if (el.dataset.section == sec)
                    el.style.display = "inline-block";
                    else el.style.display = "none";
                    }
                    var btnSections = document.querySelectorAll("#tabs-sections button");
                    for (var i = 0; i &lt; btnSections.length; i++) {
                    var el = btnSections[i];
                    el.className = el.className.replace(" active", "");
                    }
                    e.currentTarget.className += " active";
                    }
                    
                    document.getElementById("rvBtn").click();
                    document.querySelector("#tabs-sections button:first-child").click();
                </script>

                <!-- ** infosbulles -->

                <script type="text/javascript">
                    $(document).ready(function(){
                    $('[data-toggle="tooltip"]').tooltip();   
                    });
                </script>
            </body>
        </xsl:variable>
        
        <!-- SORTIE POUR LA PAGE PRINCIPAL -->
        
        <xsl:result-document href="{$main_path}">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <xsl:copy-of select="$body"/>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <!-- TEMPLATE POUR LES METADONNEES -->
    
    <xsl:template match="msDesc">
        <h5 class="titre_div">Description générale</h5>
        <ul>
            <p>
                <i>
                    <xsl:value-of select="concat(descendant::origDate, ', ', //profileDesc/langUsage/language)" />
                </i>
            </p>
            <p>
                <b>
                    <xsl:value-of select="concat(descendant::head/title, ' - ', descendant::msItemStruct/title, ' par ', descendant::msItemStruct/author/forename, ' ', descendant::msItemStruct/author/surname)" />
                </b>
            </p>
            <p><b>Orig.</b> : <xsl:value-of select="concat(descendant::settlement, ', ', descendant::repository, ', ', descendant::idno[position() = 1], ', ', descendant::msItemStruct/locus)" /></p>
        </ul>
        <h5 class="titre_div">Description technique</h5>
        <ul>Longueur de la page : <xsl:value-of select="concat(descendant::layoutDesc/layout/height, ' ', descendant::layoutDesc/layout/height/@unit)" /></ul>
        <ul>Largeur de la page : <xsl:value-of select="concat(descendant::layoutDesc/layout/width, ' ', descendant::layoutDesc/layout/width/@unit)" /></ul>
        <ul>Nombres de colonnes par pages : <xsl:value-of select="descendant::layoutDesc/layout/@columns"/></ul>
        <ul>Dimension entre les colonnes : <xsl:value-of select="concat(descendant::layoutDesc/layout/dimensions/dim, ' ', descendant::layoutDesc/layout/dimensions/dim/@unit)" /></ul>
        <ul>Marges : </ul>
        <xsl:for-each select="descendant::layoutDesc/layout[position() = 3]/list/item">
            <ul>
                <xsl:value-of select="."/>
            </ul>
        </xsl:for-each>
        <h5 class="titre_div">Informations graphologiques</h5>
        <ul>
            <xsl:value-of select="descendant::scriptDesc/scriptNote/p"/>
        </ul>
        <h5 class="titre_div">Décoration</h5>
        <ul>
            <xsl:value-of select="descendant::decoDesc/decoNote/note"/>
        </ul>
    </xsl:template>

    <!-- TEMPLATE POUR LE FAC-SIMILE INTERACTIF -->

    <xsl:template match="facsimile">
        <div id="tabs-versions" class="tabs">
            <button id="rvBtn" onclick="changeVersion(event, 'rv')">Version régularisée</button>
            <button id="ovBtn" onclick="changeVersion(event, 'ov')">Version allographétique</button>
        </div>
        <div id="tabs-sections" class="tabs">
            <xsl:for-each select="//surface">
                <button onclick="{concat('changeSection(event, ', position(), ')')}"> Page
                        <xsl:value-of select="position()"/>
                </button>
            </xsl:for-each>

        </div>
        <p style="padding:0px 0px 0px 294px">
            <i>Passer la souris sur le fac-similé pour faire apparaître la transcription</i>
        </p>
        <xsl:for-each select="//surface">
            <xsl:variable name="url" select="graphic/@url"/>
            <div class="section-wrapper" data-section="{position()}">
                <img src="{$url}" class="image_facsimile" style="border: 2mm solid black;"/>
                <div class="zone-list">
                    <xsl:for-each select="zone">
                        <!-- pour repositionner les les rectangles selon la position de l'image 
                            on ajoute ou on retire aux ordonnées et aux abssices le nombre de pixels nécéssaires -->
                        <xsl:variable name="left" select="@ulx + 240"/>
                        <xsl:variable name="top" select="@uly + 12"/>
                        <xsl:variable name="width" select="number(@lrx) - number(@ulx)"/>
                        <xsl:variable name="height" select="number(@lry) - number(@uly)"/>
                        <xsl:variable name="id" select="@xml:id"/>
                        <xsl:variable name="facs" select="concat('#', $id)"/>
                        <div class="zone"
                            style="top: {$top}px; left: {$left}px; height: {$height}px; width: {$width}px;">
                            <span style="top: {$height}px;">
                                <xsl:apply-templates select="//seg[@facs = $facs]"/>
                            </span>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <!-- TEMPLATE VERSION REGULARISEE -->

    <xsl:template match="p[@n]" mode="graphNormalize">
        <xsl:apply-templates mode="graphNormalize"/>
    </xsl:template>

    <xsl:template match="seg" mode="graphNormalize">
        <xsl:variable name="numerotation">
            <xsl:text>l.</xsl:text>
            <xsl:number count="seg" format="1" level="any"/>
            <xsl:text> : </xsl:text>
        </xsl:variable>
        <p>
            <xsl:value-of select="$numerotation"/>
            <xsl:apply-templates mode="graphNormalize"/>
        </p>
    </xsl:template>

    <!-- ** règle pour les infobulles du mode régularisé -->

    <xsl:template match="persName" mode="graphNormalize">
        <xsl:variable name="ref" select="@ref"/>
        <xsl:variable name="autres_noms" select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/persName/text()"/>
        <xsl:variable name="occupation" select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/occupation/text()"/>
        <xsl:variable name="date_naissance" select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/birth/text()"/>
        <xsl:variable name="date_mort" select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/death/text()"/>
        <xsl:for-each select=".">
            <xsl:variable name="desc" select="'Autres formes du nom :', $autres_noms, ',', $occupation, ', ', $date_naissance, '-', $date_mort"/>
            <a href="#" title="{$desc}" data-toggle="tooltip" data-placement="top">
                <xsl:apply-templates mode="graphNormalize"/>
            </a>
        </xsl:for-each>
    </xsl:template>

    <!-- ** règle pour la récupération du texte en mode régularisé -->

    <xsl:template match="choice" mode="graphNormalize">
        <xsl:value-of
            select="
                .//reg/text() |
                .//reg/pc |
                .//expan/text() |
                .//expan/ex/text()
                "
        />
    </xsl:template>


    <!-- TEMPLATE VERSION ALLOGRAPHETIQUE -->

    <xsl:template match="p[@n]" mode="graphOriginal">
        <xsl:apply-templates mode="graphOriginal"/>
    </xsl:template>

    <xsl:template match="seg" mode="graphOriginal">
        <xsl:variable name="numerotation">
            <xsl:text>l.</xsl:text>
            <xsl:number count="seg" format="1" level="any"/>
            <xsl:text> : </xsl:text>
        </xsl:variable>
        <p>
            <xsl:value-of select="$numerotation"/>
            <xsl:apply-templates mode="graphOriginal"/>
        </p>
    </xsl:template>

    <!-- ** règle pour les infobulles du mode allographétique -->

    <xsl:template match="persName" mode="graphOriginal">

        <xsl:variable name="ref" select="@ref"/>
        <xsl:variable name="autres_noms"
            select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/persName/text()"/>
        <xsl:variable name="occupation"
            select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/occupation/text()"/>
        <xsl:variable name="date_naissance"
            select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/birth/text()"/>
        <xsl:variable name="date_mort"
            select="ancestor::TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id = replace($ref, '#', '')]/death/text()"/>
        <xsl:for-each select=".">
            <xsl:variable name="desc"
                select="'Autres formes du nom :', $autres_noms, ',', $occupation, ', ', $date_naissance, '-', $date_mort"/>
            <a href="#" title="{$desc}" data-toggle="tooltip">
                <xsl:apply-templates mode="graphOriginal"/>
            </a>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="choice" mode="graphOriginal">
        <xsl:value-of
            select="
                .//abbr/text() |
                .//orig/text()
                "
        />
    </xsl:template>

    <!-- TEMPLATES COMMUNES -->

    <!-- ** règle pour les <lb> -->

    <xsl:template match="descendant::lb" mode="#all">
        <xsl:text>-</xsl:text>
    </xsl:template>
    
    
    <!-- TEMPLATES SPECIFIQUES -->

    <!-- **règles  pour le contenu du facsimilé intéractive -->

    <xsl:template match="
            //abbr/text() |
            //orig/text()">
        <span class="ov">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template
        match="
            //reg/text() |
            //reg/pc |
            //expan/text() |
            //expan/ex/text()">
        <span class="rv">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
