TRUNCATE TABLE locali RESTART IDENTITY CASCADE;

INSERT INTO
    locali (
        nome,
        descrizione,
        latitudine,
        longitudine,
        tipo
    )
VALUES (
        'Noir Club Milano',
        'Via Roma, 5 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.480931,
        9.114002,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Monza',
        'Piazza del Mercato, 12 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.557504,
        9.230114,
        'PUB'
    ),
    (
        'Lumen Lab Bergamo',
        'Via Dante, 19 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.726677,
        9.705572,
        'BAR'
    ),
    (
        'Suburra Studio Brescia',
        'Corso Italia, 26 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.588662,
        10.145710,
        'LOUNGE'
    ),
    (
        'Mirage Social Como',
        'Via Cavour, 33 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.798731,
        9.009968,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Varese',
        'Via Milano, 40 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.786837,
        8.825857,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Lecco',
        'Via Verdi, 47 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.799784,
        9.349514,
        'PUB'
    ),
    (
        'Tempio Lab Sondrio',
        'Piazza Castello, 54 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.187886,
        9.885391,
        'BAR'
    ),
    (
        'Cantiere Studio Pavia',
        'Via Mazzini, 61 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.151153,
        9.172483,
        'LOUNGE'
    ),
    (
        'Nebula Social Lodi',
        'Largo della Notte, 68 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.351232,
        9.424240,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cremona',
        'Via Garibaldi, 75 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.169898,
        10.056002,
        'DISCOTECA'
    ),
    (
        'District Social Club Mantova',
        'Viale della Stazione, 82 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.137230,
        10.736277,
        'PUB'
    ),
    (
        'Marea Lab Busto Arsizio',
        'Via Roma, 89 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.666166,
        8.822955,
        'BAR'
    ),
    (
        'Magnet Studio Legnano',
        'Piazza del Mercato, 96 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.545630,
        8.847475,
        'LOUNGE'
    ),
    (
        'Terminal Social Rho',
        'Via Dante, 103 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.573699,
        9.056496,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Sesto San Giovanni',
        'Corso Italia, 110 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.571355,
        9.270757,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Cinisello Balsamo',
        'Via Cavour, 117 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.562547,
        9.290199,
        'PUB'
    ),
    (
        'Ritual Lab Treviglio',
        'Via Milano, 124 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.506024,
        9.602327,
        'BAR'
    ),
    (
        'Panorama Studio Desenzano del Garda',
        'Via Verdi, 131 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.511229,
        10.554863,
        'LOUNGE'
    ),
    (
        'Corte Social Crema',
        'Piazza Castello, 138 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.407605,
        9.700576,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Vigevano',
        'Via Mazzini, 145 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.339349,
        8.781332,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Cantu',
        'Largo della Notte, 152 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.707048,
        9.097102,
        'PUB'
    ),
    (
        'Cargo Lab Gallarate',
        'Via Garibaldi, 159 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.610475,
        8.748547,
        'BAR'
    ),
    (
        'Cromo Studio Seregno',
        'Viale della Stazione, 166 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.604020,
        9.169676,
        'LOUNGE'
    ),
    (
        'Bottega Social Milano',
        'Via Roma, 173 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.480482,
        9.168373,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Monza',
        'Piazza del Mercato, 180 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.568922,
        9.227921,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Bergamo',
        'Via Dante, 7 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.670337,
        9.747165,
        'PUB'
    ),
    (
        'Zenith Lab Brescia',
        'Corso Italia, 14 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.559364,
        10.229261,
        'BAR'
    ),
    (
        'Prisma Studio Como',
        'Via Cavour, 21 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.768637,
        9.121860,
        'LOUNGE'
    ),
    (
        'Officina Social Varese',
        'Via Milano, 28 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.780208,
        8.805713,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Lecco',
        'Via Verdi, 35 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.915343,
        9.420100,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Sondrio',
        'Piazza Castello, 42 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.176734,
        9.907738,
        'PUB'
    ),
    (
        'Lumen Lab Pavia',
        'Via Mazzini, 49 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.225842,
        9.202360,
        'BAR'
    ),
    (
        'Suburra Studio Lodi',
        'Largo della Notte, 56 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.281586,
        9.428336,
        'LOUNGE'
    ),
    (
        'Mirage Social Cremona',
        'Via Garibaldi, 63 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.111054,
        9.987139,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Mantova',
        'Viale della Stazione, 70 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.121718,
        10.862266,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Busto Arsizio',
        'Via Roma, 77 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.656464,
        8.819448,
        'PUB'
    ),
    (
        'Tempio Lab Legnano',
        'Piazza del Mercato, 84 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.613153,
        8.895301,
        'BAR'
    ),
    (
        'Cantiere Studio Rho',
        'Via Dante, 91 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.581746,
        9.033316,
        'LOUNGE'
    ),
    (
        'Nebula Social Sesto San Giovanni',
        'Corso Italia, 98 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.506286,
        9.193460,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cinisello Balsamo',
        'Via Cavour, 105 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.565564,
        9.176539,
        'DISCOTECA'
    ),
    (
        'District Social Club Treviglio',
        'Via Milano, 112 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.530750,
        9.657652,
        'PUB'
    ),
    (
        'Marea Lab Desenzano del Garda',
        'Via Verdi, 119 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.459628,
        10.490991,
        'BAR'
    ),
    (
        'Magnet Studio Crema',
        'Piazza Castello, 126 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.423905,
        9.689724,
        'LOUNGE'
    ),
    (
        'Terminal Social Vigevano',
        'Via Mazzini, 133 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.265709,
        8.781539,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Cantu',
        'Largo della Notte, 140 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.692858,
        9.151191,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Gallarate',
        'Via Garibaldi, 147 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.695950,
        8.778846,
        'PUB'
    ),
    (
        'Ritual Lab Seregno',
        'Viale della Stazione, 154 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.599523,
        9.186259,
        'BAR'
    ),
    (
        'Panorama Studio Milano',
        'Via Roma, 161 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.523735,
        9.194658,
        'LOUNGE'
    ),
    (
        'Corte Social Monza',
        'Piazza del Mercato, 168 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.641029,
        9.332125,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Bergamo',
        'Via Dante, 175 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.639678,
        9.712615,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Brescia',
        'Corso Italia, 182 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.563405,
        10.217715,
        'PUB'
    ),
    (
        'Cargo Lab Como',
        'Via Cavour, 9 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.780119,
        9.107754,
        'BAR'
    ),
    (
        'Cromo Studio Varese',
        'Via Milano, 16 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.773986,
        8.814562,
        'LOUNGE'
    ),
    (
        'Bottega Social Lecco',
        'Via Verdi, 23 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.851047,
        9.470311,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Sondrio',
        'Piazza Castello, 30 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.215002,
        9.840342,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Pavia',
        'Via Mazzini, 37 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.184770,
        9.106784,
        'PUB'
    ),
    (
        'Zenith Lab Lodi',
        'Largo della Notte, 44 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.363615,
        9.562483,
        'BAR'
    ),
    (
        'Prisma Studio Cremona',
        'Via Garibaldi, 51 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.109013,
        10.046532,
        'LOUNGE'
    ),
    (
        'Officina Social Mantova',
        'Viale della Stazione, 58 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.169476,
        10.735854,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Busto Arsizio',
        'Via Roma, 65 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.642801,
        8.855401,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Legnano',
        'Piazza del Mercato, 72 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.627935,
        8.916857,
        'PUB'
    ),
    (
        'Lumen Lab Rho',
        'Via Dante, 79 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.472069,
        9.011765,
        'BAR'
    ),
    (
        'Suburra Studio Sesto San Giovanni',
        'Corso Italia, 86 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.476837,
        9.302656,
        'LOUNGE'
    ),
    (
        'Mirage Social Cinisello Balsamo',
        'Via Cavour, 93 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.603647,
        9.267566,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Treviglio',
        'Via Milano, 100 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.497502,
        9.523268,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Desenzano del Garda',
        'Via Verdi, 107 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.517061,
        10.607412,
        'PUB'
    ),
    (
        'Tempio Lab Crema',
        'Piazza Castello, 114 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.314478,
        9.685958,
        'BAR'
    ),
    (
        'Cantiere Studio Vigevano',
        'Via Mazzini, 121 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.263106,
        8.895696,
        'LOUNGE'
    ),
    (
        'Nebula Social Cantu',
        'Largo della Notte, 128 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.771600,
        9.071343,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Gallarate',
        'Via Garibaldi, 135 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.657934,
        8.799269,
        'DISCOTECA'
    ),
    (
        'District Social Club Seregno',
        'Viale della Stazione, 142 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.623707,
        9.264789,
        'PUB'
    ),
    (
        'Marea Lab Milano',
        'Via Roma, 149 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.454977,
        9.143888,
        'BAR'
    ),
    (
        'Magnet Studio Monza',
        'Piazza del Mercato, 156 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.589216,
        9.311189,
        'LOUNGE'
    ),
    (
        'Terminal Social Bergamo',
        'Via Dante, 163 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.662438,
        9.647175,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Brescia',
        'Corso Italia, 170 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.601018,
        10.235780,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Como',
        'Via Cavour, 177 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.800672,
        9.088012,
        'PUB'
    ),
    (
        'Ritual Lab Varese',
        'Via Milano, 184 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.775121,
        8.780952,
        'BAR'
    ),
    (
        'Panorama Studio Lecco',
        'Via Verdi, 11 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.837170,
        9.411829,
        'LOUNGE'
    ),
    (
        'Corte Social Sondrio',
        'Piazza Castello, 18 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.137514,
        9.833435,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Pavia',
        'Via Mazzini, 25 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.133219,
        9.179176,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Lodi',
        'Largo della Notte, 32 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.281573,
        9.568067,
        'PUB'
    ),
    (
        'Cargo Lab Cremona',
        'Via Garibaldi, 39 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.176356,
        9.955637,
        'BAR'
    ),
    (
        'Cromo Studio Mantova',
        'Viale della Stazione, 46 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.124961,
        10.818436,
        'LOUNGE'
    ),
    (
        'Bottega Social Busto Arsizio',
        'Via Roma, 53 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.577008,
        8.790270,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Legnano',
        'Piazza del Mercato, 60 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.646762,
        8.923367,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Rho',
        'Via Dante, 67 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.528721,
        9.085439,
        'PUB'
    ),
    (
        'Zenith Lab Sesto San Giovanni',
        'Corso Italia, 74 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.571400,
        9.184466,
        'BAR'
    ),
    (
        'Prisma Studio Cinisello Balsamo',
        'Via Cavour, 81 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.509832,
        9.203468,
        'LOUNGE'
    ),
    (
        'Officina Social Treviglio',
        'Via Milano, 88 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.511429,
        9.588724,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Desenzano del Garda',
        'Via Verdi, 95 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.499189,
        10.563638,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Crema',
        'Piazza Castello, 102 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.422300,
        9.623947,
        'PUB'
    ),
    (
        'Lumen Lab Vigevano',
        'Via Mazzini, 109 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.303115,
        8.828288,
        'BAR'
    ),
    (
        'Suburra Studio Cantu',
        'Largo della Notte, 116 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.783101,
        9.090585,
        'LOUNGE'
    ),
    (
        'Mirage Social Gallarate',
        'Via Garibaldi, 123 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.623725,
        8.783078,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Seregno',
        'Viale della Stazione, 130 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.642526,
        9.169767,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Milano',
        'Via Roma, 137 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.434177,
        9.257722,
        'PUB'
    ),
    (
        'Tempio Lab Monza',
        'Piazza del Mercato, 144 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.577676,
        9.332216,
        'BAR'
    ),
    (
        'Cantiere Studio Bergamo',
        'Via Dante, 151 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.704339,
        9.605394,
        'LOUNGE'
    ),
    (
        'Nebula Social Brescia',
        'Corso Italia, 158 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.601514,
        10.265564,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Como',
        'Via Cavour, 165 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.864380,
        9.153419,
        'DISCOTECA'
    ),
    (
        'District Social Club Varese',
        'Via Milano, 172 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.862443,
        8.771610,
        'PUB'
    ),
    (
        'Marea Lab Lecco',
        'Via Verdi, 179 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.854877,
        9.351900,
        'BAR'
    ),
    (
        'Magnet Studio Sondrio',
        'Piazza Castello, 6 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.158025,
        9.807582,
        'LOUNGE'
    ),
    (
        'Terminal Social Pavia',
        'Via Mazzini, 13 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.170177,
        9.235849,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Lodi',
        'Largo della Notte, 20 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.285924,
        9.548651,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Cremona',
        'Via Garibaldi, 27 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.127801,
        10.011981,
        'PUB'
    ),
    (
        'Ritual Lab Mantova',
        'Viale della Stazione, 34 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.211278,
        10.870668,
        'BAR'
    ),
    (
        'Panorama Studio Busto Arsizio',
        'Via Roma, 41 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.617992,
        8.884045,
        'LOUNGE'
    ),
    (
        'Corte Social Legnano',
        'Piazza del Mercato, 48 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.553076,
        8.879473,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Rho',
        'Via Dante, 55 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.588245,
        9.052569,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Sesto San Giovanni',
        'Corso Italia, 62 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.539563,
        9.273676,
        'PUB'
    ),
    (
        'Cargo Lab Cinisello Balsamo',
        'Via Cavour, 69 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.505060,
        9.227968,
        'BAR'
    ),
    (
        'Cromo Studio Treviglio',
        'Via Milano, 76 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.520942,
        9.650435,
        'LOUNGE'
    ),
    (
        'Bottega Social Desenzano del Garda',
        'Via Verdi, 83 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.430592,
        10.609625,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Crema',
        'Piazza Castello, 90 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.313813,
        9.637932,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Vigevano',
        'Via Mazzini, 97 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.326204,
        8.882034,
        'PUB'
    ),
    (
        'Zenith Lab Cantu',
        'Largo della Notte, 104 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.707924,
        9.069982,
        'BAR'
    ),
    (
        'Prisma Studio Gallarate',
        'Via Garibaldi, 111 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.707734,
        8.750694,
        'LOUNGE'
    ),
    (
        'Officina Social Seregno',
        'Viale della Stazione, 118 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.663242,
        9.224301,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Milano',
        'Via Roma, 125 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.454507,
        9.203388,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Monza',
        'Piazza del Mercato, 132 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.587234,
        9.343953,
        'PUB'
    ),
    (
        'Lumen Lab Bergamo',
        'Via Dante, 139 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.662811,
        9.711891,
        'BAR'
    ),
    (
        'Suburra Studio Brescia',
        'Corso Italia, 146 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.510242,
        10.195126,
        'LOUNGE'
    ),
    (
        'Mirage Social Como',
        'Via Cavour, 153 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.828703,
        9.053200,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Varese',
        'Via Milano, 160 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.798541,
        8.865298,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Lecco',
        'Via Verdi, 167 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.805305,
        9.391026,
        'PUB'
    ),
    (
        'Tempio Lab Sondrio',
        'Piazza Castello, 174 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.229715,
        9.957575,
        'BAR'
    ),
    (
        'Cantiere Studio Pavia',
        'Via Mazzini, 181 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.133491,
        9.112305,
        'LOUNGE'
    ),
    (
        'Nebula Social Lodi',
        'Largo della Notte, 8 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.285924,
        9.572522,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cremona',
        'Via Garibaldi, 15 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.178904,
        10.084983,
        'DISCOTECA'
    ),
    (
        'District Social Club Mantova',
        'Viale della Stazione, 22 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.140743,
        10.736639,
        'PUB'
    ),
    (
        'Marea Lab Busto Arsizio',
        'Via Roma, 29 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.651349,
        8.881666,
        'BAR'
    ),
    (
        'Magnet Studio Legnano',
        'Piazza del Mercato, 36 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.607901,
        8.989957,
        'LOUNGE'
    ),
    (
        'Terminal Social Rho',
        'Via Dante, 43 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.550477,
        8.961152,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Sesto San Giovanni',
        'Corso Italia, 50 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.572552,
        9.201901,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Cinisello Balsamo',
        'Via Cavour, 57 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.577807,
        9.284729,
        'PUB'
    ),
    (
        'Ritual Lab Treviglio',
        'Via Milano, 64 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.476715,
        9.532469,
        'BAR'
    ),
    (
        'Panorama Studio Desenzano del Garda',
        'Via Verdi, 71 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.424544,
        10.544416,
        'LOUNGE'
    ),
    (
        'Corte Social Crema',
        'Piazza Castello, 78 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.336882,
        9.704973,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Vigevano',
        'Via Mazzini, 85 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.340913,
        8.806576,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Cantu',
        'Largo della Notte, 92 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.755809,
        9.093037,
        'PUB'
    ),
    (
        'Cargo Lab Gallarate',
        'Via Garibaldi, 99 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.659524,
        8.856154,
        'BAR'
    ),
    (
        'Cromo Studio Seregno',
        'Viale della Stazione, 106 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.693432,
        9.139968,
        'LOUNGE'
    ),
    (
        'Bottega Social Milano',
        'Via Roma, 113 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.455029,
        9.154269,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Monza',
        'Piazza del Mercato, 120 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.524925,
        9.317779,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Bergamo',
        'Via Dante, 127 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.714754,
        9.639213,
        'PUB'
    ),
    (
        'Zenith Lab Brescia',
        'Corso Italia, 134 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.570548,
        10.220069,
        'BAR'
    ),
    (
        'Prisma Studio Como',
        'Via Cavour, 141 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.799422,
        9.006747,
        'LOUNGE'
    ),
    (
        'Officina Social Varese',
        'Via Milano, 148 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.769629,
        8.886297,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Lecco',
        'Via Verdi, 155 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.905071,
        9.404994,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Sondrio',
        'Piazza Castello, 162 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.210051,
        9.891402,
        'PUB'
    ),
    (
        'Lumen Lab Pavia',
        'Via Mazzini, 169 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.142471,
        9.098591,
        'BAR'
    ),
    (
        'Suburra Studio Lodi',
        'Largo della Notte, 176 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.291091,
        9.567037,
        'LOUNGE'
    ),
    (
        'Mirage Social Cremona',
        'Via Garibaldi, 183 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.168735,
        10.082012,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Mantova',
        'Viale della Stazione, 10 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.204271,
        10.745012,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Busto Arsizio',
        'Via Roma, 17 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.581244,
        8.785547,
        'PUB'
    ),
    (
        'Tempio Lab Legnano',
        'Piazza del Mercato, 24 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.628114,
        8.973462,
        'BAR'
    ),
    (
        'Cantiere Studio Rho',
        'Via Dante, 31 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.520765,
        9.059206,
        'LOUNGE'
    ),
    (
        'Nebula Social Sesto San Giovanni',
        'Corso Italia, 38 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.493046,
        9.302781,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cinisello Balsamo',
        'Via Cavour, 45 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.601953,
        9.290693,
        'DISCOTECA'
    ),
    (
        'District Social Club Treviglio',
        'Via Milano, 52 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.557893,
        9.655027,
        'PUB'
    ),
    (
        'Marea Lab Desenzano del Garda',
        'Via Verdi, 59 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.414674,
        10.573750,
        'BAR'
    ),
    (
        'Magnet Studio Crema',
        'Piazza Castello, 66 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.344062,
        9.757131,
        'LOUNGE'
    ),
    (
        'Terminal Social Vigevano',
        'Via Mazzini, 73 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.351068,
        8.912250,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Cantu',
        'Largo della Notte, 80 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.776990,
        9.093489,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Gallarate',
        'Via Garibaldi, 87 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.695385,
        8.728595,
        'PUB'
    ),
    (
        'Ritual Lab Seregno',
        'Viale della Stazione, 94 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.696560,
        9.262575,
        'BAR'
    ),
    (
        'Panorama Studio Milano',
        'Via Roma, 101 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.430892,
        9.240654,
        'LOUNGE'
    ),
    (
        'Corte Social Monza',
        'Piazza del Mercato, 108 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.579736,
        9.243231,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Bergamo',
        'Via Dante, 115 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.733741,
        9.633715,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Brescia',
        'Corso Italia, 122 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.484440,
        10.162701,
        'PUB'
    ),
    (
        'Cargo Lab Como',
        'Via Cavour, 129 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.787491,
        9.143496,
        'BAR'
    ),
    (
        'Cromo Studio Varese',
        'Via Milano, 136 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.876627,
        8.789660,
        'LOUNGE'
    ),
    (
        'Bottega Social Lecco',
        'Via Verdi, 143 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.873578,
        9.381649,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Sondrio',
        'Piazza Castello, 150 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.227638,
        9.883995,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Pavia',
        'Via Mazzini, 157 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.237408,
        9.096655,
        'PUB'
    ),
    (
        'Zenith Lab Lodi',
        'Largo della Notte, 164 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.370548,
        9.451771,
        'BAR'
    ),
    (
        'Prisma Studio Cremona',
        'Via Garibaldi, 171 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.188704,
        9.986775,
        'LOUNGE'
    ),
    (
        'Officina Social Mantova',
        'Viale della Stazione, 178 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.109408,
        10.780930,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Busto Arsizio',
        'Via Roma, 5 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.638725,
        8.819288,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Legnano',
        'Piazza del Mercato, 12 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.607245,
        8.913828,
        'PUB'
    ),
    (
        'Lumen Lab Rho',
        'Via Dante, 19 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.518223,
        9.052154,
        'BAR'
    ),
    (
        'Suburra Studio Sesto San Giovanni',
        'Corso Italia, 26 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.505067,
        9.267406,
        'LOUNGE'
    ),
    (
        'Mirage Social Cinisello Balsamo',
        'Via Cavour, 33 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.498403,
        9.282592,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Treviglio',
        'Via Milano, 40 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.525214,
        9.629109,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Desenzano del Garda',
        'Via Verdi, 47 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.500734,
        10.563201,
        'PUB'
    ),
    (
        'Tempio Lab Crema',
        'Piazza Castello, 54 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.347907,
        9.619396,
        'BAR'
    ),
    (
        'Cantiere Studio Vigevano',
        'Via Mazzini, 61 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.334509,
        8.826832,
        'LOUNGE'
    ),
    (
        'Nebula Social Cantu',
        'Largo della Notte, 68 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.717370,
        9.186482,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Gallarate',
        'Via Garibaldi, 75 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.687271,
        8.759352,
        'DISCOTECA'
    ),
    (
        'District Social Club Seregno',
        'Viale della Stazione, 82 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.629014,
        9.190543,
        'PUB'
    ),
    (
        'Marea Lab Milano',
        'Via Roma, 89 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.452488,
        9.157305,
        'BAR'
    ),
    (
        'Magnet Studio Monza',
        'Piazza del Mercato, 96 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.539775,
        9.261671,
        'LOUNGE'
    ),
    (
        'Terminal Social Bergamo',
        'Via Dante, 103 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.751144,
        9.705671,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Brescia',
        'Corso Italia, 110 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.589937,
        10.230282,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Como',
        'Via Cavour, 117 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.784214,
        9.092870,
        'PUB'
    ),
    (
        'Ritual Lab Varese',
        'Via Milano, 124 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.760649,
        8.790906,
        'BAR'
    ),
    (
        'Panorama Studio Lecco',
        'Via Verdi, 131 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.848187,
        9.410498,
        'LOUNGE'
    ),
    (
        'Corte Social Sondrio',
        'Piazza Castello, 138 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.188465,
        9.872598,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Pavia',
        'Via Mazzini, 145 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.177759,
        9.112392,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Lodi',
        'Largo della Notte, 152 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.310882,
        9.567389,
        'PUB'
    ),
    (
        'Cargo Lab Cremona',
        'Via Garibaldi, 159 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.168723,
        9.971451,
        'BAR'
    ),
    (
        'Cromo Studio Mantova',
        'Viale della Stazione, 166 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.106575,
        10.793872,
        'LOUNGE'
    ),
    (
        'Bottega Social Busto Arsizio',
        'Via Roma, 173 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.627253,
        8.822730,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Legnano',
        'Piazza del Mercato, 180 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.632711,
        8.952182,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Rho',
        'Via Dante, 7 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.552735,
        8.995843,
        'PUB'
    ),
    (
        'Zenith Lab Sesto San Giovanni',
        'Corso Italia, 14 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.498396,
        9.157908,
        'BAR'
    ),
    (
        'Prisma Studio Cinisello Balsamo',
        'Via Cavour, 21 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.527581,
        9.210522,
        'LOUNGE'
    ),
    (
        'Officina Social Treviglio',
        'Via Milano, 28 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.562569,
        9.525653,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Desenzano del Garda',
        'Via Verdi, 35 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.461433,
        10.556662,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Crema',
        'Piazza Castello, 42 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.327532,
        9.719617,
        'PUB'
    ),
    (
        'Lumen Lab Vigevano',
        'Via Mazzini, 49 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.314125,
        8.813038,
        'BAR'
    ),
    (
        'Suburra Studio Cantu',
        'Largo della Notte, 56 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.758427,
        9.051687,
        'LOUNGE'
    ),
    (
        'Mirage Social Gallarate',
        'Via Garibaldi, 63 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.691016,
        8.834507,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Seregno',
        'Viale della Stazione, 70 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.604690,
        9.193223,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Milano',
        'Via Roma, 77 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.425306,
        9.263275,
        'PUB'
    ),
    (
        'Tempio Lab Monza',
        'Piazza del Mercato, 84 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.586655,
        9.202435,
        'BAR'
    ),
    (
        'Cantiere Studio Bergamo',
        'Via Dante, 91 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.668204,
        9.733034,
        'LOUNGE'
    ),
    (
        'Nebula Social Brescia',
        'Corso Italia, 98 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.536375,
        10.260027,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Como',
        'Via Cavour, 105 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.828209,
        9.163263,
        'DISCOTECA'
    ),
    (
        'District Social Club Varese',
        'Via Milano, 112 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.832054,
        8.897006,
        'PUB'
    ),
    (
        'Marea Lab Lecco',
        'Via Verdi, 119 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.903571,
        9.415724,
        'BAR'
    ),
    (
        'Magnet Studio Sondrio',
        'Piazza Castello, 126 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.196213,
        9.878965,
        'LOUNGE'
    ),
    (
        'Terminal Social Pavia',
        'Via Mazzini, 133 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.224368,
        9.165860,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Lodi',
        'Largo della Notte, 140 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.361765,
        9.542185,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Cremona',
        'Via Garibaldi, 147 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.130161,
        9.985771,
        'PUB'
    ),
    (
        'Ritual Lab Mantova',
        'Viale della Stazione, 154 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.126069,
        10.813426,
        'BAR'
    ),
    (
        'Panorama Studio Busto Arsizio',
        'Via Roma, 161 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.643198,
        8.852508,
        'LOUNGE'
    ),
    (
        'Corte Social Legnano',
        'Piazza del Mercato, 168 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.609710,
        8.875936,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Rho',
        'Via Dante, 175 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.481298,
        9.005617,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Sesto San Giovanni',
        'Corso Italia, 182 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.507106,
        9.205154,
        'PUB'
    ),
    (
        'Cargo Lab Cinisello Balsamo',
        'Via Cavour, 9 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.563018,
        9.156640,
        'BAR'
    ),
    (
        'Cromo Studio Treviglio',
        'Via Milano, 16 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.488351,
        9.625032,
        'LOUNGE'
    ),
    (
        'Bottega Social Desenzano del Garda',
        'Via Verdi, 23 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.496470,
        10.466177,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Crema',
        'Piazza Castello, 30 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.353112,
        9.695018,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Vigevano',
        'Via Mazzini, 37 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.304693,
        8.807094,
        'PUB'
    ),
    (
        'Zenith Lab Cantu',
        'Largo della Notte, 44 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.730117,
        9.195574,
        'BAR'
    ),
    (
        'Prisma Studio Gallarate',
        'Via Garibaldi, 51 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.670990,
        8.822584,
        'LOUNGE'
    ),
    (
        'Officina Social Seregno',
        'Viale della Stazione, 58 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.694708,
        9.247695,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Milano',
        'Via Roma, 65 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.449846,
        9.110943,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Monza',
        'Piazza del Mercato, 72 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.566711,
        9.314956,
        'PUB'
    ),
    (
        'Lumen Lab Bergamo',
        'Via Dante, 79 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.740714,
        9.749849,
        'BAR'
    ),
    (
        'Suburra Studio Brescia',
        'Corso Italia, 86 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.531883,
        10.251403,
        'LOUNGE'
    ),
    (
        'Mirage Social Como',
        'Via Cavour, 93 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.813636,
        9.101720,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Varese',
        'Via Milano, 100 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.787065,
        8.780107,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Lecco',
        'Via Verdi, 107 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.848900,
        9.322344,
        'PUB'
    ),
    (
        'Tempio Lab Sondrio',
        'Piazza Castello, 114 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.150236,
        9.906863,
        'BAR'
    ),
    (
        'Cantiere Studio Pavia',
        'Via Mazzini, 121 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.173218,
        9.104607,
        'LOUNGE'
    ),
    (
        'Nebula Social Lodi',
        'Largo della Notte, 128 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.310187,
        9.443620,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cremona',
        'Via Garibaldi, 135 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.147871,
        9.948615,
        'DISCOTECA'
    ),
    (
        'District Social Club Mantova',
        'Viale della Stazione, 142 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.143682,
        10.801703,
        'PUB'
    ),
    (
        'Marea Lab Busto Arsizio',
        'Via Roma, 149 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.554552,
        8.871940,
        'BAR'
    ),
    (
        'Magnet Studio Legnano',
        'Piazza del Mercato, 156 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.550784,
        8.905872,
        'LOUNGE'
    ),
    (
        'Terminal Social Rho',
        'Via Dante, 163 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.478034,
        9.020557,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Sesto San Giovanni',
        'Corso Italia, 170 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.499899,
        9.206295,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Cinisello Balsamo',
        'Via Cavour, 177 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.589548,
        9.195160,
        'PUB'
    ),
    (
        'Ritual Lab Treviglio',
        'Via Milano, 184 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.550841,
        9.647108,
        'BAR'
    ),
    (
        'Panorama Studio Desenzano del Garda',
        'Via Verdi, 11 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.441973,
        10.469005,
        'LOUNGE'
    ),
    (
        'Corte Social Crema',
        'Piazza Castello, 18 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.306526,
        9.694507,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Vigevano',
        'Via Mazzini, 25 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.374789,
        8.829994,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Cantu',
        'Largo della Notte, 32 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.757717,
        9.175797,
        'PUB'
    ),
    (
        'Cargo Lab Gallarate',
        'Via Garibaldi, 39 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.679111,
        8.831977,
        'BAR'
    ),
    (
        'Cromo Studio Seregno',
        'Viale della Stazione, 46 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.705853,
        9.157098,
        'LOUNGE'
    ),
    (
        'Bottega Social Milano',
        'Via Roma, 53 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.406646,
        9.134381,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Monza',
        'Piazza del Mercato, 60 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.539647,
        9.301513,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Bergamo',
        'Via Dante, 67 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.705976,
        9.632174,
        'PUB'
    ),
    (
        'Zenith Lab Brescia',
        'Corso Italia, 74 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.565536,
        10.254504,
        'BAR'
    ),
    (
        'Prisma Studio Como',
        'Via Cavour, 81 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.768235,
        9.102360,
        'LOUNGE'
    ),
    (
        'Officina Social Varese',
        'Via Milano, 88 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.850351,
        8.763325,
        'LIVE_CLUB'
    ),
    (
        'Noir Club Lecco',
        'Via Verdi, 95 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.894916,
        9.472055,
        'DISCOTECA'
    ),
    (
        'Velvet Social Club Sondrio',
        'Piazza Castello, 102 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.122872,
        9.802309,
        'PUB'
    ),
    (
        'Lumen Lab Pavia',
        'Via Mazzini, 109 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.162135,
        9.186576,
        'BAR'
    ),
    (
        'Suburra Studio Lodi',
        'Largo della Notte, 116 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.369081,
        9.486665,
        'LOUNGE'
    ),
    (
        'Mirage Social Cremona',
        'Via Garibaldi, 123 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.159002,
        9.956459,
        'LIVE_CLUB'
    ),
    (
        'Orbit Club Mantova',
        'Viale della Stazione, 130 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.179274,
        10.811759,
        'DISCOTECA'
    ),
    (
        'Apollo Social Club Busto Arsizio',
        'Via Roma, 137 - Busto Arsizio (VA). dj set serali, cocktail signature e atmosfera urbana.',
        45.563528,
        8.892697,
        'PUB'
    ),
    (
        'Tempio Lab Legnano',
        'Piazza del Mercato, 144 - Legnano (MI). live set del weekend, drink classici e sala principale fino a tardi.',
        45.636535,
        8.928066,
        'BAR'
    ),
    (
        'Cantiere Studio Rho',
        'Via Dante, 151 - Rho (MI). selezione house e techno, ingresso fluido e tavoli interni.',
        45.486527,
        9.117315,
        'LOUNGE'
    ),
    (
        'Nebula Social Sesto San Giovanni',
        'Corso Italia, 158 - Sesto San Giovanni (MI). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.568416,
        9.209553,
        'LIVE_CLUB'
    ),
    (
        'Bastione Club Cinisello Balsamo',
        'Via Cavour, 165 - Cinisello Balsamo (MI). ambiente elegante, musica crossover e bancone centrale.',
        45.549605,
        9.193791,
        'DISCOTECA'
    ),
    (
        'District Social Club Treviglio',
        'Via Milano, 172 - Treviglio (BG). lineup locale, birre artigianali e dancefloor compatto.',
        45.521315,
        9.568597,
        'PUB'
    ),
    (
        'Marea Lab Desenzano del Garda',
        'Via Verdi, 179 - Desenzano del Garda (BS). dj set serali, cocktail signature e atmosfera urbana.',
        45.513649,
        10.587473,
        'BAR'
    ),
    (
        'Magnet Studio Crema',
        'Piazza Castello, 6 - Crema (CR). live set del weekend, drink classici e sala principale fino a tardi.',
        45.316865,
        9.761926,
        'LOUNGE'
    ),
    (
        'Terminal Social Vigevano',
        'Via Mazzini, 13 - Vigevano (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.331070,
        8.906593,
        'LIVE_CLUB'
    ),
    (
        'Turbina Club Cantu',
        'Largo della Notte, 20 - Cantu (CO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.764577,
        9.120478,
        'DISCOTECA'
    ),
    (
        'Aurora Social Club Gallarate',
        'Via Garibaldi, 27 - Gallarate (VA). ambiente elegante, musica crossover e bancone centrale.',
        45.688955,
        8.865776,
        'PUB'
    ),
    (
        'Ritual Lab Seregno',
        'Viale della Stazione, 34 - Seregno (MB). lineup locale, birre artigianali e dancefloor compatto.',
        45.624310,
        9.254512,
        'BAR'
    ),
    (
        'Panorama Studio Milano',
        'Via Roma, 41 - Milano (MI). dj set serali, cocktail signature e atmosfera urbana.',
        45.468781,
        9.187360,
        'LOUNGE'
    ),
    (
        'Corte Social Monza',
        'Piazza del Mercato, 48 - Monza (MB). live set del weekend, drink classici e sala principale fino a tardi.',
        45.576769,
        9.311364,
        'LIVE_CLUB'
    ),
    (
        'Vox Club Bergamo',
        'Via Dante, 55 - Bergamo (BG). selezione house e techno, ingresso fluido e tavoli interni.',
        45.670507,
        9.733574,
        'DISCOTECA'
    ),
    (
        'Eclisse Social Club Brescia',
        'Corso Italia, 62 - Brescia (BS). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.581288,
        10.145666,
        'PUB'
    ),
    (
        'Cargo Lab Como',
        'Via Cavour, 69 - Como (CO). ambiente elegante, musica crossover e bancone centrale.',
        45.853896,
        9.044218,
        'BAR'
    ),
    (
        'Cromo Studio Varese',
        'Via Milano, 76 - Varese (VA). lineup locale, birre artigianali e dancefloor compatto.',
        45.816365,
        8.842653,
        'LOUNGE'
    ),
    (
        'Bottega Social Lecco',
        'Via Verdi, 83 - Lecco (LC). dj set serali, cocktail signature e atmosfera urbana.',
        45.842079,
        9.322292,
        'LIVE_CLUB'
    ),
    (
        'Vinile Club Sondrio',
        'Piazza Castello, 90 - Sondrio (SO). live set del weekend, drink classici e sala principale fino a tardi.',
        46.212014,
        9.827294,
        'DISCOTECA'
    ),
    (
        'Arco Social Club Pavia',
        'Via Mazzini, 97 - Pavia (PV). selezione house e techno, ingresso fluido e tavoli interni.',
        45.150154,
        9.205853,
        'PUB'
    ),
    (
        'Zenith Lab Lodi',
        'Largo della Notte, 104 - Lodi (LO). rooftop serale, mixology contemporanea e vista sulla citta.',
        45.294941,
        9.564051,
        'BAR'
    ),
    (
        'Prisma Studio Cremona',
        'Via Garibaldi, 111 - Cremona (CR). ambiente elegante, musica crossover e bancone centrale.',
        45.157342,
        9.988503,
        'LOUNGE'
    ),
    (
        'Officina Social Mantova',
        'Viale della Stazione, 118 - Mantova (MN). lineup locale, birre artigianali e dancefloor compatto.',
        45.097618,
        10.863090,
        'LIVE_CLUB'
    );