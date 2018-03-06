use Data::Dumper;
use LWP::Simple;

#assemble the esearch URL with the desired time period, type of organism
my $base = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
my $url = $base . 'esearch.fcgi?db=gds&term=(homo sapiens[ORGN]+OR+Mus musculus[ORGN]+OR+Rattus norvegicus[ORGN])+AND+gse[ETYP]+AND+GPL44[ACCN]+OR+GPL80[ACCN]+OR+GPL81[ACCN]+OR+GPL85[ACCN]+OR+GPL92[ACCN]+OR+GPL93[ACCN]+OR+GPL94[ACCN]+OR+GPL95[ACCN]+OR+GPL97[ACCN]+OR+GPL201[ACCN]+OR+GPL284[ACCN]+OR+GPL339[ACCN]+OR+GPL340[ACCN]+OR+GPL570[ACCN]+OR+GPL571[ACCN]+OR+GPL737[ACCN]+OR+GPL887[ACCN]+OR+GPL1261[ACCN]+OR+GPL1355[ACCN]+OR+GPL1536[ACCN]+OR+GPL1708[ACCN]+OR+GPL2006[ACCN]+OR+GPL2011[ACCN]+OR+GPL2507[ACCN]+OR+GPL2700[ACCN]+OR+GPL2881[ACCN]+AND+"Expression profiling by array"[Filter]+"published last month"[Filter])&usehistory=y';

   #everything from supported platforms, last year
#my $url = $base . 'esearch.fcgi?db=gds&term=(homo sapiens[ORGN]+OR+Mus musculus[ORGN]+OR+Rattus norvegicus[ORGN])+AND+gse[ETYP]+AND+GPL44[ACCN]+OR+GPL80[ACCN]+OR+GPL81[ACCN]+OR+GPL85[ACCN]+OR+GPL92[ACCN]+OR+GPL93[ACCN]+OR+GPL94[ACCN]+OR+GPL95[ACCN]+OR+GPL97[ACCN]+OR+GPL201[ACCN]+OR+GPL284[ACCN]+OR+GPL339[ACCN]+OR+GPL340[ACCN]+OR+GPL570[ACCN]+OR+GPL571[ACCN]+OR+GPL737[ACCN]+OR+GPL887[ACCN]+OR+GPL1261[ACCN]+OR+GPL1355[ACCN]+OR+GPL1536[ACCN]+OR+GPL1708[ACCN]+OR+GPL2006[ACCN]+OR+GPL2011[ACCN]+OR+GPL2507[ACCN]+OR+GPL2700[ACCN]+OR+GPL2881[ACCN]+AND+"published last year"[Filter])&usehistory=y';

#my $url = $base . 'esearch.fcgi?db=gds&term=(homo sapiens[ORGN]+OR+Mus musculus[ORGN]+OR+Rattus norvegicus[ORGN])+AND+gse[ETYP]+AND+GPL44[ACCN]+OR+GPL80[ACCN]+OR+GPL81[ACCN]+OR+GPL85[ACCN]+OR+GPL92[ACCN]+OR+GPL93[ACCN]+OR+GPL94[ACCN]+OR+GPL95[ACCN]+OR+GPL97[ACCN]+OR+GPL201[ACCN]+OR+GPL284[ACCN]+OR+GPL339[ACCN]+OR+GPL340[ACCN]+OR+GPL570[ACCN]+OR+GPL571[ACCN]+OR+GPL737[ACCN]+OR+GPL887[ACCN]+OR+GPL1261[ACCN]+OR+GPL1355[ACCN]+OR+GPL1536[ACCN]+OR+GPL1708[ACCN]+OR+GPL2006[ACCN]+OR+GPL2011[ACCN]+OR+GPL2507[ACCN]+OR+GPL2700[ACCN]+OR+GPL2881[ACCN]+AND+"Expression profiling by array"[Filter]+"published last month"[Filter])&usehistory=y';

#post the esearch URL
my $output = get($url);

#parse WebEnv and QueryKey
$web = $1 if ($output =~ /<WebEnv>(\S+)<\/WebEnv>/);
$key = $1 if ($output =~ /<QueryKey>(\d+)<\/QueryKey>/);

#assemble the esummary URL
$url = $base . "esummary.fcgi?db=$db&query_key=$key&WebEnv=$web";

#post the esummary URL
$docsums = get($url);
#print "$docsums";


#post the efetch URL
$data = get($url);
$dataout = getstore( $url, "geo.txt")
#print "$data";

#http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=gds&term=(homo sapiens[ORGN]+OR+Mus musculus[ORGN]+OR+Rattus norvegicus[ORGN])+AND+gse[ETYP]+AND+GPL44[ACCN]+OR+GPL80[ACCN]+OR+GPL81[ACCN]+OR+GPL85[ACCN]+OR+GPL92[ACCN]+OR+GPL93[ACCN]+OR+GPL94[ACCN]+OR+GPL95[ACCN]+OR+GPL97[ACCN]+OR+GPL201[ACCN]+OR+GPL284[ACCN]+OR+GPL339[ACCN]+OR+GPL340[ACCN]+OR+GPL570[ACCN]+OR+GPL571[ACCN]+OR+GPL737[ACCN]+OR+GPL887[ACCN]+OR+GPL1261[ACCN]+OR+GPL1355[ACCN]+OR+GPL1536[ACCN]+OR+GPL1708[ACCN]+OR+GPL2006[ACCN]+OR+GPL2011[ACCN]+OR+GPL2507[ACCN]+OR+GPL2700[ACCN]+OR+GPL2881[ACCN]+AND+"Expression profiling by array"[Filter]+"published last month"[Filter])&usehistory=y';
#http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=$db&query_key=1&WebEnv=NCID_1_31061023_130.14.22.215_9001_1449877450_1308879884_0MetA0_S_MegaStore_F_1

