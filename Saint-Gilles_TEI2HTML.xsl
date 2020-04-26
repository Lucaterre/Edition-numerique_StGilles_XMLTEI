<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output 
        method="html" 
        indent="yes" 
        encoding="UTF-8"
    />
   
   <!-- Pour éviter les espaces --> 
    
    <xsl:strip-space elements="*"/> 
    
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title[@type='main_title']"/>-
                    <xsl:value-of select="//titleStmt/title[@type='subtitle']"/>
                </title>
            </head>
            <body>
                <h1>Edition électronique en XML-TEI de la <xsl:value-of select="//titleStmt/title[@type='main_title']"/> - <xsl:value-of select="//titleStmt/title[@type='subtitle']"/></h1>
                <hr/>
                <!-- <span> pour les métadonnées -->
                <span class="metadonnées">
                    <p id="date"><i><xsl:value-of select="//head/origDate"/></i></p>
                    <h2 id="titre">La vie de Saint Gilles</h2>
                    <p id="Orig"><b>Orig.</b> Paris, Bnf, Departement des manuscrits, Ms.fr.411, f.173a-f.173c</p>
                    
                </span>
                <!-- <div> du fac-similé intéractif a centré -->
                <div class="Fac-similé_interactif">
                    <span id="image"><img src="100/faxmini.jpg" alt="image du dossier" border="1"/></span>
                </div>
                <table width="98%" border="0">
                    <tr valign="top">
                        <th width="10%"></th>
                        <th valign="middle" align="left" width="45%"> Texte original </th>
                        <th valign="middle" align="left" width="45%"> Traduction </th>
                    </tr>
                    <tr valign="top">
                        <td width="10%"></td>
                        <td>
                            
                            <p>De tribus generibus lectorum.<br/> Satis ut puto aperte demonstratum est<br/> provectis et aliquid amplius de se promittentibus<br/> non idem esse propositum cum incipientibus.<br/> Sed sicut illis aliquid licite conceditur, <br/> quod isti sine culpa minime agere possunt, <br/> ita eciam ab istis aliquid requiri<br/> Quo illi nondum obligati sunt.<br/> Nunc igitur ad promissa solvenda redeo <br/> ut videlicet ostendam qualiter eis divina scriptura legenda sit,<br/> qui adhuc in ea solam querunt scientiam.<br/> Sunt nonnulli qui divine scripture scientiam appetunt, <br/> ut vel divitias congregent, vel honores obtineant, <br/> vel famam adquirant, <br/> quorum intentio quantum perversa, tantum est miseranda<br/> Sunt rursus alii <br/> quos audire verba Dei et opera ejus discere delectat, <br/> non quia salutifera, sed quia mirabilia sunt.<br/> Scrutari archana et inaudita cognoscere volunt, <br/> multa scire et nil facere.<br/> In vanum mirantur potentiam, qui non amant misericordiam. <br/> Hos ergo quid aliud agere dicam<br/> quam preconia divina in fabulas commutare ? <br/> Sic theatralibus ludis, sic scenicis carminibus intedere solemus, <br/> ut scilicet auditum pascamus, non animum.<br/> Hujusmodi tamen non tam confundi <br/> quam adjuvari oportet censeo,<br/> quorum voluntas non utique maligna est, <br/> sed improvida.<br/> Alii vero idcirco sacram scripturam legunt<br/> ut secundum Apostoli preceptum<br/>
                                <a href="#" OnMouseOver="AffBulle('I Pierre 3, 5')" OnMouseOut="HideBulle()" OnClick="return false">parati sint omni poscenti reddere rationem <br/> de ea fide in qua positi sunt</a>, <br/> ut videlicet inimicos veritatis fortiter destruant, <br/> minus eruditos doceant, <br/> ipsi perfectius viam veritatis agnoscant <br/> et altius Dei secreta intelligentes <br/> artius ament,<br/> quorum nimirum devotio laudanda est et imitatione digna.<br/> Tria igitur sunt genera hominum sacram scripturam legentium<br/> quorum primi quidem miserandi sunt, <br/> secundi juvandi, tercii laudandi.<br/> Nos vero quia omnibus consulere intendimus, <br/> quod bonum est in omnibus augeri cupimus<br/> et quod perversum commutari. <br/> Omnes intelligere volumus quod dicimus, <br/> omnes facere quod hortamur.<br/>
                            </p>
                            
                            <p> Liber sextus. Quomodo legenda sit scriptura sacra <br/> querentibus scientiam in ea.<br/> Duo tibi lector, ordinem scilicet et modum, propono, <br/> que, si diligenter inspexeris, <br/> facile tibi iter legendi patebit.<br/> In horum vero consideratione, <br/> nec omnia tuo ingenio relinquam, <br/> neque per meam diligentiam satis tibi fieri promitto, <br/> sed sic quedam breviter prelibando transcurram<br/> ut et posita aliqua quibus erudiaris <br/> et aliqua pretermissa quibus exercearis invenias.<br/> Ordinem legendi supra quadrifarium esse commemoravi, <br/> aliud in disciplinis , alium in libris, <br/> alium in narratione atque alium in expositione, <br/> Que qualiter in divina scriptura assignanda sint<br/> nondum ostendi.</p>
                            <p><br/> De ordine qui est in disciplinis.<br/> Primum ergo hunc ordinem qui queritur in disciplinis<br/> inter <a href="#" OnMouseOver="AffBulle('une des divisions classiques des différents sens de l’Écriture. L’histoire s’attache au sens littéral, l’allégorie au sens figuré, notamment christologique, et la tropologie au sens moral.')" OnMouseOut="HideBulle()" OnClick="return false">hystoriam, allegoriam, tropologiam</a>,<br/> divinum lectorem considerare oportet, <br/> que horum alia ordine legendi precedant, <br/> in quo illud ad memoriam revocare non inutile est<br/> quod in edificiis fieri conspicitur, <br/> ubi primum quidem fundamentum ponitur,<br/> dehinc fabrica super edificatur, <br/> ad ultimum consummato opere<br/> domus colore super ducto vestitur. </p>
                            <p><br/> De hystoria. Sic nimirum in doctrina fieri oportet<br/> ut videlicet prius historiam discas<br/> et rerum gestarum veritatem a principio repetens usque ad finem<br/> quid gestum sit, quando gestum sit,<br/> ubi gestum sit, et a quibus gestum sit,<br/> diligenter memorie commendes.<br/> Hec enim quatuor precipue in hystoria requirenda sunt :<br/> persona, negocium, tempus et locus.<br/> Neque ego te perfecte subtilem posse fieri puto in allegoria,<br/> nisi prius fundatus fueris in hystoria.<br/> Noli contempnere minima hec. <br/> Paulatim defluit qui minima contempnit. <br/> Si primo alfabetum discere contempsisses, <br/> nunc inter grammaticos tantum nomen non haberes.<br/>
                            </p>
                        </td>
                        <td>
                            
                            <p>Les trois genres de lecteurs.<br/> Il a été assez clairement montré, à mon avis,<br/> que les avancés et ceux qui se promettent davantage d’eux-mêmes<br/> n’ont pas le même dessein que les commençants.<br/> Mais de même qu’on concède à ces derniers<br/> ce que les premiers ne pourraient accomplir sans faute, <br/> de même il leur est demandé <br/> ce à quoi les débutants ne sont pas encore tenus.<br/> J’en viens donc maintenant à tenir mes promesses, <br/> à savoir montrer comment doivent lire l’Écriture sainte<br/> ceux qui ne cherchent encore en elle que la science.<br/> Il y en a qui recherchent la science de l’Écriture sainte<br/> pour amasser des richesses, obtenir des honneurs, <br/> ou acquérir une bonne renommée.<br/> Leur intention est autant à plaindre qu’à blâmer. <br/> Il y en a d’autres aussi<br/> qui se plaisent à entendre les paroles de Dieu et à apprendre ses œuvres, <br/> non parce qu’elles sont salutaires, mais parce qu’elles sont admirables.<br/> Ils veulent scruter les arcanes et connaître les choses inouïes, <br/> beaucoup savoir et ne rien faire.<br/> C’est en vain qu’ils admirent la puissance ceux qui n’aiment pas la miséricorde.<br/> Que font-ils d’autre, je vous le demande,<br/> à part changer les louanges divines en fables ?<br/> C’est ainsi que nous avons l’habitude de nous attacher aux pièces de théâtres et aux poèmes faits pour la scène afin de nous nourrir l’oreille, non l’esprit. <br/> Je pense cependant qu’il ne faut pas tant réprouver ces hommes <br/> que les aider,<br/> puisque leur volonté n’est pas mauvaise, <br/> mais mal conseillée.<br/> D’autres, pour leur part, lisent l’Écriture sainte <br/> afin que, selon le précepte apostolique, <br/>
                                <a href="#" OnMouseOver="AffBulle('I Pierre 3, 5')" OnMouseOut="HideBulle()" OnClick="return false">ils soient prêts à rendre raison à tout homme qui le demande<br/> de la foi où ils sont établis</a>,<br/> de sorte qu’ils détruisent avec courage les ennemis de la vérité, <br/> qu’ils instruisent les moins savants, <br/> qu’ils connaissent eux-mêmes plus parfaitement le chemin de la vérité<br/> et que comprenant plus profondément les secrets divins,<br/>
                                    ils les aiment plus étroitement.<br/> Leur piété est très louable et digne d’imitation.<br/> Il y a donc trois sortes d’hommes qui lisent l’Écriture sainte : <br/> Les premiers sont à plaindre, <br/> les seconds à aider, les troisièmes à louer.<br/> Quant à nous, parce que nous entendons tous les conseiller, <br/> nous désirons augmenter en tous le bien qui s’y trouve, <br/> et y remplacer le mal, <br/> nous voulons que tous comprennent ce que nous disons, <br/> que tous accomplissent ce à quoi nous les exhortons.<br/>
                            </p>
                            
                            <p>Livre six. Comment doivent lire l’Écriture sainte<br/> ceux qui y cherchent la science.<br/> Je te propose, lecteur, deux choses, à savoir l’ordre et la manière.<br/> Si tu les observes avec attention, <br/> le chemin de la lecture s’ouvrira facilement à toi.<br/> Dans leur examen <br/> je ne laisserai pas tout à ton talent, <br/> sans pour autant promettre de te donner satisfaction par mes soins, <br/> mais je parcourrai certains points en en donnant de brefs avant-goûts, <br/> de sorte que tu trouves des choses exposées qui t’instruisent <br/> et d’autres omises qui t’exercent.<br/> J’ai rappelé plus haut que l’ordre de la lecture était quadruple : <br/> l’un consiste dans les disciplines, un autre dans les livres, <br/> un autre dans la narration et un autre dans l’exposition.<br/> Comment les déterminer dans l’Écriture sainte<br/> je ne l’ai pas encore montré.</p>
                            <p><br/> L’ordre dans les disciplines.<br/> Tout d’abord, il faut donc que le lecteur de la Bible considère <br/> l’ordre recherché dans les disciplines<br/> entre <a href="#" OnMouseOver="AffBulle('une des divisions classiques des différents sens de l’Écriture. L’histoire s’attache au sens littéral, l’allégorie au sens figuré, notamment christologique, et la tropologie au sens moral.')" OnMouseOut="HideBulle()" OnClick="return false">l’histoire, l’allégorie et la tropologie</a>, <br/> et quelle est celle qui précède les autres dans l’ordre de la lecture, <br/> point où il n’est pas inutile de rappeler<br/> ce qu’on voit faire dans les constructions, <br/> où tout d’abord l’on pose les fondations, <br/> avant d’y ajouter le bâtiment, <br/> pour qu’à la fin, une fois l’ouvrage achevé, <br/> la maison soit décorée d’une peinture qui y est ajoutée.</p>
                            <p><br/>Sur l’histoire. Ainsi faut-il vraiment que dans ta formation<br/> tu apprennes d’abord l’histoire<br/> et, en répétant le cours véridique des faits du début à la fin, <br/> tu confies soigneusement à ta mémoire<br/> ce qui s’est passé, quand cela s’est passé, <br/> où cela s’est passé et par qui cela a été fait.<br/> Il y a quatre choses principales à rechercher en histoire : <br/> la personne, le fait, le temps et le lieu.<br/> Et je ne pense pas que tu puisses devenir subtil en allégorie, <br/> si tu n’as pas de bases historiques. <br/> Ne méprise pas ces petites choses.<br/> Il tombe insensiblement celui qui méprise les petites choses.<br/> Si tu avais d’abord méprisé d’apprendre l’alphabet, <br/> tu n’aurais pas aujourd’hui un si grand nom parmi les grammairiens. <br/>
                            </p>
                        </td>
                    </tr>
                </table>
            </body>
        </html>    
    </xsl:template>
    
    
    
</xsl:stylesheet>