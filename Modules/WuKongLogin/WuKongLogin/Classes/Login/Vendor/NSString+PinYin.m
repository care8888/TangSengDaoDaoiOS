//
//  NSString+PinYin.m
//  TableViewIndexTest
//
//  Created by Shadow on 14-3-5.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "NSString+PinYin.h"

#define HANZI_START 19968
#define HANZI_COUNT 20902
static char firstLetterArray[HANZI_COUNT] =
    "ydkqsxnwzssxjbymgcczqpssqbycdscdqldylybssjgyqzjjfgcclzznwdwzjljpfyynnjjtmy"
    "nzwzhflzppqhgccyynmjqyxxgd"
    "nnsnsjnjnsnnmlnrxyfsngnnnnqzggllyjlnyzssecykyyhqwjssggyxyqyjtwktjhychmnxjt"
    "lhjyqbyxdldwrrjnwysrldzjpc"
    "bzjjbrcfslnczstzfxxchtrqggddlyccssymmrjcyqzpwwjjyfcrwfdfzqpyddwyxkyjawjffx"
    "jbcftzyhhycyswccyxsclcxxwz"
    "cxnbgnnxbxlzsqsbsjpysazdhmdzbqbscwdzzyytzhbtsyyfzgntnxjywqnknphhlxgybfmjnb"
    "jhhgqtjcysxstkzglyckglysmz"
    "xyalmeldccxgzyrjxjzlnjzcqkcnnjwhjczccqljststbnhbtyxceqxkkwjyflzqlyhjxspsfx"
    "lmpbysxxxytccnylllsjxfhjxp"
    "jbtffyabyxbcczbzyclwlczggbtssmdtjcxpthyqtgjjxcjfzkjzjqnlzwlslhdzbwjncjzyzs"
    "qnycqynzcjjwybrtwpyftwexcs"
    "kdzctbyhyzqyyjxzcfbzzmjyxxsdczottbzljwfckscsxfyrlrygmbdthjxsqjccsbxyytswfb"
    "jdztnbcnzlcyzzpsacyzzsqqcs"
    "hzqydxlbpjllmqxqydzxsqjtzpxlcglqdcwzfhctdjjsfxjejjtlbgxsxjmyjjqpfzasyjnsyd"
    "jxkjcdjsznbartcclnjqmwnqnc"
    "lllkbdbzzsyhqcltwlccrshllzntylnewyzyxczxxgdkdmtcedejtsyyssdqdfmxdbjlkrwnql"
    "ybglxnlgtgxbqjdznyjsjyjcjm"
    "rnymgrcjczgjmzmgxmmryxkjnymsgmzzymknfxmbdtgfbhcjhkylpfmdxlxjjsmsqgzsjlqdld"
    "gjycalcmzcsdjllnxdjffffjcn"
    "fnnffpfkhkgdpqxktacjdhhzdddrrcfqyjkqccwjdxhwjlyllzgcfcqjsmlzpbjjblsbcjggdc"
    "kkdezsqcckjgcgkdjtjllzycxk"
    "lqccgjcltfpcqczgwbjdqyzjjbyjhsjddwgfsjgzkcjctllfspkjgqjhzzljplgjgjjthjjyjz"
    "ccmlzlyqbgjwmljkxzdznjqsyz"
    "mljlljkywxmkjlhskjhbmclyymkxjqlbmllkmdxxkwyxwslmlpsjqqjqxyqfjtjdxmxxllcrqb"
    "syjbgwynnggbcnxpjtgpapfgdj"
    "qbhbncfjyzjkjkhxqfgqckfhygkhdkllsdjqxpqyaybnqsxqnszswhbsxwhxwbzzxdmndjbsbk"
    "bbzklylxgwxjjwaqzmywsjqlsj"
    "xxjqwjeqxnchetlzalyyyszzpnkyzcptlshtzcfycyxyljsdcjqagyslcllyyysslqqqnldxzs"
    "ccscadycjysfsgbfrsszqsbxjp"
    "sjysdrckgjlgtkzjzbdktcsyqpyhstcldjnhmymcgxyzhjdctmhltxzhylamoxyjcltyfbqqjp"
    "fbdfehthsqhzywwcncxcdwhowg"
    "yjlegmdqcwgfjhcsntmydolbygnqwesqpwnmlrydzszzlyqpzgcwxhnxpyxshmdqjgztdppbfb"
    "hzhhjyfdzwkgkzbldnzsxhqeeg"
    "zxylzmmzyjzgszxkhkhtxexxgylyapsthxdwhzydpxagkydxbhnhnkdnjnmyhylpmgecslnzhk"
    "xxlbzzlbmlsfbhhgsgyyggbhsc"
    "yajtxglxtzmcwzydqdqmngdnllszhngjzwfyhqswscelqajynytlsxthaznkzzsdhlaxxtwwcj"
    "hqqtddwzbcchyqzflxpslzqgpz"
    "sznglydqtbdlxntctajdkywnsyzljhhdzckryyzywmhychhhxhjkzwsxhdnxlyscqydpslyzwm"
    "ypnkxyjlkchtyhaxqsyshxasmc"
    "hkdscrsgjpwqsgzjlwwschsjhsqnhnsngndantbaalczmsstdqjcjktscjnxplggxhhgoxzcxp"
    "dmmhldgtybynjmxhmrzplxjzck"
    "zxshflqxxcdhxwzpckczcdytcjyxqhlxdhypjqxnlsyydzozjnhhqezysjyayxkypdgxddnspp"
    "yzndhthrhxydpcjjhtcnnctlhb"
    "ynyhmhzllnnxmylllmdcppxhmxdkycyrdltxjchhznxclcclylnzsxnjzzlnnnnwhyqsnjhxyn"
    "ttdkyjpychhyegkcwtwlgjrlgg"
    "tgtygyhpyhylqyqgcwyqkpyyettttlhyylltyttsylnyzwgywgpydqqzzdqnnkcqnmjjzzbxtq"
    "fjkdffbtkhzkbxdjjkdjjtlbwf"
    "zpptkqtztgpdwntpjyfalqmkgxbcclzfhzcllllanpnxtjklcclgyhdzfgyddgcyyfgydxksse"
    "ndhykdndknnaxxhbpbyyhxccga"
    "pfqyjjdmlxcsjzllpcnbsxgjyndybwjspcwjlzkzddtacsbkzdyzypjzqsjnkktknjdjgyepgt"
    "lnyqnacdntcyhblgdzhbbydmjr"
    "egkzyheyybjmcdtafzjzhgcjnlghldwxjjkytcyksssmtwcttqzlpbszdtwcxgzagyktywxlnl"
    "cpbclloqmmzsslcmbjcsdzkydc"
    "zjgqjdsmcytzqqlnzqzxssbpkdfqmddzzsddtdmfhtdycnaqjqkypbdjyyxtljhdrqxlmhkydh"
    "rnlklytwhllrllrcxylbnsrnzz"
    "symqzzhhkyhxksmzsyzgcxfbnbsqlfzxxnnxkxwymsddyqnggqmmyhcdzttfgyyhgsbttybykj"
    "dnkyjbelhdypjqnfxfdnkzhqks"
    "byjtzbxhfdsbdaswpawajldyjsfhblcnndnqjtjnchxfjsrfwhzfmdrfjyxwzpdjkzyjympcyz"
    "nynxfbytfyfwygdbnzzzdnytxz"
    "emmqbsqehxfznbmflzzsrsyqjgsxwzjsprytjsjgskjjgljjynzjjxhgjkymlpyyycxycgqzsw"
    "hwlyrjlpxslcxmnsmwklcdnkny"
    "npsjszhdzeptxmwywxyysywlxjqcqxzdclaeelmcpjpclwbxsqhfwrtfnjtnqjhjqdxhwlbycc"
    "fjlylkyynldxnhycstyywncjtx"
    "ywtrmdrqnwqcmfjdxzmhmayxnwmyzqtxtlmrspwwjhanbxtgzypxyyrrclmpamgkqjszycymyj"
    "snxtplnbappypylxmyzkynldgy"
    "jzcchnlmzhhanqnbgwqtzmxxmllhgdzxnhxhrxycjmffxywcfsbssqlhnndycannmtcjcypnxn"
    "ytycnnymnmsxndlylysljnlxys"
    "sqmllyzlzjjjkyzzcsfbzxxmstbjgnxnchlsnmcjscyznfzlxbrnnnylmnrtgzqysatswryhyj"
    "zmgdhzgzdwybsscskxsyhytsxg"
    "cqgxzzbhyxjscrhmkkbsczjyjymkqhzjfnbhmqhysnjnzybknqmcjgqhwlsnzswxkhljhyybqc"
    "bfcdsxdldspfzfskjjzwzxsddx"
    "jseeegjscssygclxxnwwyllymwwwgydkzjggggggsycknjwnjpcxbjjtqtjwdsspjxcxnzxnme"
    "lptfsxtllxcljxjjljsxctnswx"
    "lennlyqrwhsycsqnybyaywjejqfwqcqqcjqgxaldbzzyjgkgxbltqyfxjltpydkyqhpmatlcnd"
    "nkxmtxynhklefxdllegqtymsaw"
    "hzmljtkynxlyjzljeeyybqqffnlyxhdsctgjhxywlkllxqkcctnhjlqmkkzgcyygllljdcgydh"
    "zwypysjbzjdzgyzzhywyfqdtyz"
    "szyezklymgjjhtsmqwyzljyywzcsrkqyqltdxwcdrjalwsqzwbdcqyncjnnszjlncdcdtlzzza"
    "cqqzzddxyblxcbqjylzllljddz"
    "jgyqyjzyxnyyyexjxksdaznyrdlzyyynjlslldyxjcykywnqcclddnyyynycgczhjxcclgzqjg"
    "nwnncqqjysbzzxyjxjnxjfzbsb"
    "dsfnsfpzxhdwztdmpptflzzbzdmyypqjrsdzsqzsqxbdgcpzswdwcsqzgmdhzxmwwfybpngphd"
    "mjthzsmmbgzmbzjcfzhfcbbnmq"
    "dfmbcmcjxlgpnjbbxgyhyyjgptzgzmqbqdcgybjxlwnkydpdymgcftpfxyztzxdzxtgkptybbc"
    "lbjaskytssqyymscxfjhhlslls"
    "jpqjjqaklyldlycctsxmcwfgngbqxllllnyxtyltyxytdpjhnhgnkbyqnfjyyzbyyessessgdy"
    "hfhwtcqbsdzjtfdmxhcnjzymqw"
    "srxjdzjqbdqbbsdjgnfbknbxdkqhmkwjjjgdllthzhhyyyyhhsxztyyyccbdbpypzyccztjpzy"
    "wcbdlfwzcwjdxxhyhlhwczxjtc"
    "nlcdpxnqczczlyxjjcjbhfxwpywxzpcdzzbdccjwjhmlxbqxxbylrddgjrrctttgqdczwmxfyt"
    "mmzcwjwxyywzzkybzcccttqnhx"
    "nwxxkhkfhtswoccjybcmpzzykbnnzpbthhjdlszddytyfjpxyngfxbyqxzbhxcpxxtnzdnnycn"
    "xsxlhkmzxlthdhkghxxsshqyhh"
    "cjyxglhzxcxnhekdtgqxqypkdhentykcnymyyjmkqyyyjxzlthhqtbyqhxbmyhsqckwwyllhcy"
    "ylnneqxqwmcfbdccmljggxdqkt"
    "lxkknqcdgcjwyjjlyhhqyttnwchhxcxwherzjydjccdbqcdgdnyxzdhcqrxcbhztqcbxwgqwyy"
    "bxhmbymykdyecmqkyaqyngyzsl"
    "fnkkqgyssqyshngjctxkzycssbkyxhyylstycxqthysmnscpmmgcccccmnztasmgqzjhklosjy"
    "lswtmqzyqkdzljqqyplzycztcq"
    "qpbbcjzclpkhqcyyxxdtdddsjcxffllchqxmjlwcjcxtspycxndtjshjwhdqqqckxyamylsjhm"
    "lalygxcyydmamdqmlmcznnyybz"
    "xkyflmcncmlhxrcjjhsylnmtjggzgywjxsrxcwjgjqhqzdqjdcjjskjkgdzcgjjyjylxzxxcdq"
    "hhheslmhlfsbdjsyyshfyssczq"
    "lpbdrfnztzdkykhsccgkwtqzckmsynbcrxqbjyfaxpzzedzcjykbcjwhyjbqzzywnyszptdkzp"
    "fpbaztklqnhbbzptpptyzzybhn"
    "ydcpzmmcycqmcjfzzdcmnlfpbplngqjtbttajzpzbbdnjkljqylnbzqhksjznggqstzkcxchpz"
    "snbcgzkddzqanzgjkdrtlzldwj"
    "njzlywtxndjzjhxnatncbgtzcsskmljpjytsnwxcfjwjjtkhtzplbhsnjssyjbhbjyzlstlsbj"
    "hdnwqpslmmfbjdwajyzccjtbnn"
    "nzwxxcdslqgdsdpdzgjtqqpsqlyyjzlgyhsdlctcbjtktyczjtqkbsjlgnnzdncsgpynjzjjyy"
    "knhrpwszxmtncszzyshbyhyzax"
    "ywkcjtllckjjtjhgcssxyqyczbynnlwqcglzgjgqyqcczssbcrbcskydznxjsqgxssjmecnstj"
    "tpbdlthzwxqwqczexnqczgwesg"
    "ssbybstscslccgbfsdqnzlccglllzghzcthcnmjgyzazcmsksstzmmzckbjygqljyjppldxrkz"
    "yxccsnhshhdznlzhzjjcddcbcj"
    "xlbfqbczztpqdnnxljcthqzjgylklszzpcjdscqjhjqkdxgpbajynnsmjtzdxlcjyryynhjbng"
    "zjkmjxltbsllrzpylssznxjhll"
    "hyllqqzqlsymrcncxsljmlzltzldwdjjllnzggqxppskyggggbfzbdkmwggcxmcgdxjmcjsdyc"
    "abxjdlnbcddygskydqdxdjjyxh"
    "saqazdzfslqxxjnqzylblxxwxqqzbjzlfbblylwdsljhxjyzjwtdjcyfqzqzzdzsxzzqlzcdzf"
    "xhwspynpqzmlpplffxjjnzzyls"
    "jnyqzfpfzgsywjjjhrdjzzxtxxglghtdxcskyswmmtcwybazbjkshfhgcxmhfqhyxxyzftsjyz"
    "bxyxpzlchmzmbxhzzssyfdmncw"
    "dabazlxktcshhxkxjjzjsthygxsxyyhhhjwxkzxssbzzwhhhcwtzzzpjxsyxqqjgzyzawllcwx"
    "znxgyxyhfmkhydwsqmnjnaycys"
    "pmjkgwcqhylajgmzxhmmcnzhbhxclxdjpltxyjkdyylttxfqzhyxxsjbjnayrsmxyplckdnyhl"
    "xrlnllstycyyqygzhhsccsmcct"
    "zcxhyqfpyyrpbflfqnntszlljmhwtcjqyzwtlnmlmdwmbzzsnzrbpdddlqjjbxtcsnzqqygwcs"
    "xfwzlxccrszdzmcyggdyqsgtnn"
    "nlsmymmsyhfbjdgyxccpshxczcsbsjyygjmpbwaffyfnxhydxzylremzgzzyndsznlljcsqfnx"
    "xkptxzgxjjgbmyyssnbtylbnlh"
    "bfzdcyfbmgqrrmzszxysjtznnydzzcdgnjafjbdknzblczszpsgcycjszlmnrznbzzldlnllys"
    "xsqzqlcxzlsgkbrxbrbzcycxzj"
    "zeeyfgklzlnyhgzcgzlfjhgtgwkraajyzkzqtsshjjxdzyznynnzyrzdqqhgjzxsszbtkjbbfr"
    "tjxllfqwjgclqtymblpzdxtzag"
    "bdhzzrbgjhwnjtjxlkscfsmwlldcysjtxkzscfwjlbnntzlljzllqblcqmqqcgcdfpbphzczjl"
    "pyyghdtgwdxfczqyyyqysrclqz"
    "fklzzzgffcqnwglhjycjjczlqzzyjbjzzbpdcsnnjgxdqnknlznnnnpsntsdyfwwdjzjysxyyc"
    "zcyhzwbbyhxrylybhkjksfxtjj"
    "mmchhlltnyymsxxyzpdjjycsycwmdjjkqyrhllngpngtlyycljnnnxjyzfnmlrgjjtyzbsyzms"
    "jyjhgfzqmsyxrszcytlrtqzsst"
    "kxgqkgsptgxdnjsgcqcqhmxggztqydjjznlbznxqlhyqgggthqscbyhjhhkyygkggcmjdzllcc"
    "lxqsftgjslllmlcskctbljszsz"
    "mmnytpzsxqhjcnnqnyexzqzcpshkzzyzxxdfgmwqrllqxrfztlystctmjcsjjthjnxtnrztzfq"
    "rhcgllgcnnnnjdnlnnytsjtlny"
    "xsszxcgjzyqpylfhdjsbbdczgjjjqzjqdybssllcmyttmqnbhjqmnygjyeqyqmzgcjkpdcnmyz"
    "gqllslnclmholzgdylfzslncnz"
    "lylzcjeshnyllnxnjxlyjyyyxnbcljsswcqqnnyllzldjnllzllbnylnqchxyyqoxccqkyjxxx"
    "yklksxeyqhcqkkkkcsnyxxyqxy"
    "gwtjohthxpxxhsnlcykychzzcbwqbbwjqcscszsslcylgddsjzmmymcytsdsxxscjpqqsqylyf"
    "zychdjynywcbtjsydchcyddjlb"
    "djjsodzyqyskkyxdhhgqjyohdyxwgmmmazdybbbppbcmnnpnjzsmtxerxjmhqdntpjdcbsnmss"
    "ythjtslmltrcplzszmlqdsdmjm"
    "qpnqdxcfrnnfsdqqyxhyaykqyddlqyyysszbydslntfgtzqbzmchdhczcwfdxtmqqsphqwwxsr"
    "gjcwnntzcqmgwqjrjhtqjbbgwz"
    "fxjhnqfxxqywyyhyscdydhhqmrmtmwctbszppzzglmzfollcfwhmmsjzttdhlmyffytzzgzysk"
    "jjxqyjzqbhmbzclyghgfmshpcf"
    "zsnclpbqsnjyzslxxfpmtyjygbxlldlxpzjyzjyhhzcywhjylsjexfszzywxkzjlnadymlymqj"
    "pwxxhxsktqjezrpxxzghmhwqpw"
    "qlyjjqjjzszcnhjlchhnxjlqwzjhbmzyxbdhhypylhlhlgfwlcfyytlhjjcwmscpxstkpnhjxs"
    "ntyxxtestjctlsslstdlllwwyh"
    "dnrjzsfgxssyczykwhtdhwjglhtzdqdjzxxqgghltzphcsqfclnjtclzpfstpdynylgmjllycq"
    "hynspchylhqyqtmzymbywrfqyk"
    "jsyslzdnjmpxyyssrhzjnyqtqdfzbwwdwwrxcwggyhxmkmyyyhmxmzhnksepmlqqmtcwctmxmx"
    "jpjjhfxyyzsjzhtybmstsyjznq"
    "jnytlhynbyqclcycnzwsmylknjxlggnnpjgtysylymzskttwlgsmzsylmpwlcwxwqcssyzsyxy"
    "rhssntsrwpccpwcmhdhhxzdzyf"
    "jhgzttsbjhgyglzysmyclllxbtyxhbbzjkssdmalhhycfygmqypjyjqxjllljgclzgqlycjcct"
    "otyxmtmshllwlqfxymzmklpszz"
    "cxhkjyclctyjcyhxsgyxnnxlzwpyjpxhjwpjpwxqqxlxsdhmrslzzydwdtcxknstzshbsccstp"
    "lwsscjchjlcgchssphylhfhhxj"
    "sxallnylmzdhzxylsxlmzykcldyahlcmddyspjtqjzlngjfsjshctsdszlblmssmnyymjqbjhr"
    "zwtyydchjljapzwbgqxbkfnbjd"
    "llllyylsjydwhxpsbcmljpscgbhxlqhyrljxyswxhhzlldfhlnnymjljyflyjycdrjlfsyzfsl"
    "lcqyqfgqyhnszlylmdtdjcnhbz"
    "llnwlqxygyyhbmgdhxxnhlzzjzxczzzcyqzfngwpylcpkpykpmclgkdgxzgxwqbdxzzkzfbddl"
    "zxjtpjpttbythzzdwslcpnhslt"
    "jxxqlhyxxxywzyswttzkhlxzxzpyhgzhknfsyhntjrnxfjcpjztwhplshfcrhnslxxjxxyhzqd"
    "xqwnnhyhmjdbflkhcxcwhjfyjc"
    "fpqcxqxzyyyjygrpynscsnnnnchkzdyhflxxhjjbyzwttxnncyjjymswyxqrmhxzwfqsylzngg"
    "bhyxnnbwttcsybhxxwxyhhxyxn"
    "knyxmlywrnnqlxbbcljsylfsytjzyhyzawlhorjmnsczjxxxyxchcyqryxqzddsjfslyltsffy"
    "xlmtyjmnnyyyxltzcsxqclhzxl"
    "wyxzhnnlrxkxjcdyhlbrlmbrdlaxksnlljlyxxlynrylcjtgncmtlzllcyzlpzpzyawnjjfybd"
    "yyzsepckzzqdqpbpsjpdyttbdb"
    "bbyndycncpjmtmlrmfmmrwyfbsjgygsmdqqqztxmkqwgxllpjgzbqrdjjjfpkjkcxbljmswldt"
    "sjxldlppbxcwkcqqbfqbccajzg"
    "mykbhyhhzykndqzybpjnspxthlfpnsygyjdbgxnhhjhzjhstrstldxskzysybmxjlxyslbzysl"
    "zxjhfybqnbylljqkygzmcyzzym"
    "ccslnlhzhwfwyxzmwyxtynxjhbyymcysbmhysmydyshnyzchmjjmzcaahcbjbbhblytylsxsnx"
    "gjdhkxxtxxnbhnmlngsltxmrhn"
    "lxqqxmzllyswqgdlbjhdcgjyqyymhwfmjybbbyjyjwjmdpwhxqldyapdfxxbcgjspckrssyzjm"
    "slbzzjfljjjlgxzgyxyxlszqkx"
    "bexyxhgcxbpndyhwectwwcjmbtxchxyqqllxflyxlljlssnwdbzcmyjclwswdczpchqekcqbwl"
    "cgydblqppqzqfnqdjhymmcxtxd"
    "rmzwrhxcjzylqxdyynhyyhrslnrsywwjjymtltllgtqcjzyabtckzcjyccqlysqxalmzynywlw"
    "dnzxqdllqshgpjfjljnjabcqzd"
    "jgthhsstnyjfbswzlxjxrhgldlzrlzqzgsllllzlymxxgdzhgbdphzpbrlwnjqbpfdwonnnhly"
    "pcnjccndmbcpbzzncyqxldomzb"
    "lzwpdwyygdstthcsqsccrsssyslfybnntyjszdfndpdhtqzmbqlxlcmyffgtjjqwftmnpjwdnl"
    "bzcmmcngbdzlqlpnfhyymjylsd"
    "chdcjwjcctljcldtljjcbddpndsszycndbjlggjzxsxnlycybjjxxcbylzcfzppgkcxqdzfztj"
    "jfjdjxzbnzyjqctyjwhdyczhym"
    "djxttmpxsplzcdwslshxypzgtfmlcjtacbbmgdewycyzxdszjyhflystygwhkjyylsjcxgywjc"
    "bllcsnddbtzbsclyzczzssqdll"
    "mjyyhfllqllxfdyhabxggnywyypllsdldllbjcyxjznlhljdxyyqytdlllbngpfdfbbqbzzmdp"
    "jhgclgmjjpgaehhbwcqxajhhhz"
    "chxyphjaxhlphjpgpzjqcqzgjjzzgzdmqyybzzphyhybwhazyjhykfgdpfqsdlzmljxjpgalxz"
    "daglmdgxmmzqwtxdxxpfdmmssy"
    "mpfmdmmkxksyzyshdzkjsysmmzzzmdydyzzczxbmlstmdyemxckjmztyymzmzzmsshhdccjewx"
    "xkljsthwlsqlyjzllsjssdppmh"
    "nlgjczyhmxxhgncjmdhxtkgrmxfwmckmwkdcksxqmmmszzydkmsclcmpcjmhrpxqpzdsslcxky"
    "xtwlkjyahzjgzjwcjnxyhmmbml"
    "gjxmhlmlgmxctkzmjlyscjsyszhsyjzjcdajzhbsdqjzgwtkqxfkdmsdjlfmnhkzqkjfeypzys"
    "zcdpynffmzqykttdzzefmzlbnp"
    "plplpbpszalltnlkckqzkgenjlwalkxydpxnhsxqnwqnkxqclhyxxmlnccwlymqyckynnlcjns"
    "zkpyzkcqzqljbdmdjhlasqlbyd"
    "wqlwdgbqcryddztjybkbwszdxdtnpjdtcnqnfxqqmgnseclstbhpwslctxxlpwydzklnqgzcqa"
    "pllkqcylbqmqczqcnjslqzdjxl"
    "ddhpzqdljjxzqdjyzhhzlkcjqdwjppypqakjyrmpzbnmcxkllzllfqpylllmbsglzysslrsysq"
    "tmxyxzqzbscnysyztffmzzsmzq"
    "hzssccmlyxwtpzgxzjgzgsjzgkddhtqggzllbjdzlsbzhyxyzhzfywxytymsdnzzyjgtcmtnxq"
    "yxjscxhslnndlrytzlryylxqht"
    "xsrtzcgyxbnqqzfhykmzjbzymkbpnlyzpblmcnqyzzzsjztjctzhhyzzjrdyzhnfxklfzslkgj"
    "tctssyllgzrzbbjzzklpkbczys"
    "nnyxbjfbnjzzxcdwlzyjxzzdjjgggrsnjkmsmzjlsjywqsnyhqjsxpjztnlsnshrnynjtwchgl"
    "bnrjlzxwjqxqkysjycztlqzybb"
    "ybyzjqdwgyzcytjcjxckcwdkkzxsnkdnywwyyjqyytlytdjlxwkcjnklccpzcqqdzzqlcsfqch"
    "qqgssmjzzllbjjzysjhtsjdysj"
    "qjpdszcdchjkjzzlpycgmzndjxbsjzzsyzyhgxcpbjydssxdzncglqmbtsfcbfdzdlznfgfjgf"
    "smpnjqlnblgqcyyxbqgdjjqsrf"
    "kztjdhczklbsdzcfytplljgjhtxzcsszzxstjygkgckgynqxjplzbbbgcgyjzgczqszlbjlsjf"
    "zgkqqjcgycjbzqtldxrjnbsxxp"
    "zshszycfwdsjjhxmfczpfzhqhqmqnknlyhtycgfrzgnqxcgpdlbzcsczqlljblhbdcypscppdy"
    "mzzxgyhckcpzjgslzlnscnsldl"
    "xbmsdlddfjmkdqdhslzxlsznpqpgjdlybdskgqlbzlnlkyyhzttmcjnqtzzfszqktlljtyylln"
    "llqyzqlbdzlslyyzxmdfszsnxl"
    "xznczqnbbwskrfbcylctnblgjpmczzlstlxshtzcyzlzbnfmqnlxflcjlyljqcbclzjgnsstbr"
    "mhxzhjzclxfnbgxgtqncztmsfz"
    "kjmssncljkbhszjntnlzdntlmmjxgzjyjczxyhyhwrwwqnztnfjscpyshzjfyrdjsfscjzbjfz"
    "qzchzlxfxsbzqlzsgyftzdcszx"
    "zjbjpszkjrhxjzcgbjkhcggtxkjqglxbxfgtrtylxqxhdtsjxhjzjjcmzlcqsbtxwqgxtxxhxf"
    "tsdkfjhzyjfjxnzldlllcqsqqz"
    "qwqxswqtwgwbzcgcllqzbclmqjtzgzyzxljfrmyzflxnsnxxjkxrmjdzdmmyxbsqbhgzmwfwyg"
    "mjlzbyytgzyccdjyzxsngnyjyz"
    "nbgpzjcqsyxsxrtfyzgrhztxszzthcbfclsyxzlzqmzlmplmxzjssfsbysmzqhxxnxrxhqzzzs"
    "slyflczjrcrxhhzxqndshxsjjh"
    "qcjjbcynsysxjbqjpxzqplmlxzkyxlxcnlcycxxzzlxdlllmjyhzxhyjwkjrwyhcpsgnrzlfzw"
    "fzznsxgxflzsxzzzbfcsyjdbrj"
    "krdhhjxjljjtgxjxxstjtjxlyxqfcsgswmsbctlqzzwlzzkxjmltmjyhsddbxgzhdlbmyjfrzf"
    "cgclyjbpmlysmsxlszjqqhjzfx"
    "gfqfqbphngyyqxgztnqwyltlgwgwwhnlfmfgzjmgmgbgtjflyzzgzyzaflsspmlbflcwbjztlj"
    "jmzlpjjlymqtmyyyfbgygqzgly"
    "zdxqyxrqqqhsxyyqxygjtyxfsfsllgnqcygycwfhcccfxpylypllzqxxxxxqqhhsshjzcftscz"
    "jxspzwhhhhhapylqnlpqafyhxd"
    "ylnkmzqgggddesrenzltzgchyppcsqjjhclljtolnjpzljlhymhezdydsqycddhgznndzclzyw"
    "llznteydgnlhslpjjbdgwxpcnn"
    "tycklkclwkllcasstknzdnnjttlyyzssysszzryljqkcgdhhyrxrzydgrgcwcgzqffbppjfzyn"
    "akrgywyjpqxxfkjtszzxswzddf"
    "bbqtbgtzkznpzfpzxzpjszbmqhkyyxyldkljnypkyghgdzjxxeaxpnznctzcmxcxmmjxnkszqn"
    "mnlwbwwqjjyhclstmcsxnjcxxt"
    "pcnfdtnnpglllzcjlspblpgjcdtnjjlyarscffjfqwdpgzdwmrzzcgodaxnssnyzrestyjwjyj"
    "dbcfxnmwttbqlwstszgybljpxg"
    "lbnclgpcbjftmxzljylzxcltpnclcgxtfzjshcrxsfysgdkntlbyjcyjllstgqcbxnhzxbxkly"
    "lhzlqzlnzcqwgzlgzjncjgcmnz"
    "zgjdzxtzjxycyycxxjyyxjjxsssjstsstdppghtcsxwzdcsynptfbchfbblzjclzzdbxgcjlhp"
    "xnfzflsyltnwbmnjhszbmdnbcy"
    "sccldnycndqlyjjhmqllcsgljjsyfpyyccyltjantjjpwycmmgqyysxdxqmzhszxbftwwzqswq"
    "rfkjlzjqqyfbrxjhhfwjgzyqac"
    "myfrhcyybynwlpexcczsyyrlttdmqlrkmpbgmyyjprkznbbsqyxbhyzdjdnghpmfsgbwfzmfqm"
    "mbzmzdcgjlnnnxyqgmlrygqccy"
    "xzlwdkcjcggmcjjfyzzjhycfrrcmtznzxhkqgdjxccjeascrjthpljlrzdjrbcqhjdnrhylyqj"
    "symhzydwcdfryhbbydtssccwbx"
    "glpzmlzjdqsscfjmmxjcxjytycghycjwynsxlfemwjnmkllswtxhyyyncmmcyjdqdjzglljwjn"
    "khpzggflccsczmcbltbhbqjxqd"
    "jpdjztghglfjawbzyzjltstdhjhctcbchflqmpwdshyytqwcnntjtlnnmnndyyyxsqkxwyyflx"
    "xnzwcxypmaelyhgjwzzjbrxxaq"
    "jfllpfhhhytzzxsgqjmhspgdzqwbwpjhzjdyjcqwxkthxsqlzyymysdzgnqckknjlwpnsyscsy"
    "zlnmhqsyljxbcxtlhzqzpcycyk"
    "pppnsxfyzjjrcemhszmnxlxglrwgcstlrsxbygbzgnxcnlnjlclynymdxwtzpalcxpqjcjwtcy"
    "yjlblxbzlqmyljbghdslssdmxm"
    "bdczsxyhamlczcpjmcnhjyjnsykchskqmczqdllkablwjqsfmocdxjrrlyqchjmybyqlrhetfj"
    "zfrfksryxfjdwtsxxywsqjysly"
    "xwjhsdlxyyxhbhawhwjcxlmyljcsqlkydttxbzslfdxgxsjkhsxxybssxdpwncmrptqzczenyg"
    "cxqfjxkjbdmljzmqqxnoxslyxx"
    "lylljdzptymhbfsttqqwlhsgynlzzalzxclhtwrrqhlstmypyxjjxmnsjnnbryxyjllyqyltwy"
    "lqyfmlkljdnlltfzwkzhljmlhl"
    "jnljnnlqxylmbhhlnlzxqchxcfxxlhyhjjgbyzzkbxscqdjqdsndzsygzhhmgsxcsymxfepcqw"
    "wrbpyyjqryqcyjhqqzyhmwffhg"
    "zfrjfcdbxntqyzpcyhhjlfrzgpbxzdbbgrqstlgdgylcqmgchhmfywlzyxkjlypjhsywmqqggz"
    "mnzjnsqxlqsyjtcbehsxfszfxz"
    "wfllbcyyjdytdthwzsfjmqqyjlmqsxlldttkghybfpwdyysqqrnqwlgwdebzwcyygcnlkjxtmx"
    "myjsxhybrwfymwfrxyymxysctz"
    "ztfykmldhqdlgyjnlcryjtlpsxxxywlsbrrjwxhqybhtydnhhxmmywytycnnmnssccdalwztcp"
    "qpyjllqzyjswjwzzmmglmxclmx"
    "nzmxmzsqtzppjqblpgxjzhfljjhycjsrxwcxsncdlxsyjdcqzxslqyclzxlzzxmxqrjmhrhzjb"
    "hmfljlmlclqnldxzlllfyprgjy"
    "nxcqqdcmqjzzxhnpnxzmemmsxykynlxsxtljxyhwdcwdzhqyybgybcyscfgfsjnzdrzzxqxrzr"
    "qjjymcanhrjtldbpyzbstjhxxz"
    "ypbdwfgzzrpymnnkxcqbyxnbnfyckrjjcmjegrzgyclnnzdnkknsjkcljspgyyclqqjybzssql"
    "llkjftbgtylcccdblsppfylgyd"
    "tzjqjzgkntsfcxbdkdxxhybbfytyhbclnnytgdhryrnjsbtcsnyjqhklllzslydxxwbcjqsbxn"
    "pjzjzjdzfbxxbrmladhcsnclbj"
    "dstblprznswsbxbcllxxlzdnzsjpynyxxyftnnfbhjjjgbygjpmmmmsszljmtlyzjxswxtyled"
    "qpjmpgqzjgdjlqjwjqllsdgjgy"
    "gmscljjxdtygjqjjjcjzcjgdzdshqgzjggcjhqxsnjlzzbxhsgzxcxyljxyxyydfqqjhjfxdhc"
    "txjyrxysqtjxyefyyssyxjxncy"
    "zxfxcsxszxyyschshxzzzgzzzgfjdldylnpzgsjaztyqzpbxcbdztzczyxxyhhscjshcggqhjh"
    "gxhsctmzmehyxgebtclzkkwytj"
    "zrslekestdbcyhqqsayxcjxwwgsphjszsdncsjkqcxswxfctynydpccczjqtcwjqjzzzqzljzh"
    "lsbhpydxpsxshhezdxfptjqyzc"
    "xhyaxncfzyyhxgnqmywntzsjbnhhgymxmxqcnssbcqsjyxxtyyhybcqlmmszmjzzllcogxzaaj"
    "zyhjmchhcxzsxsdznleyjjzjbh"
    "zwjzsqtzpsxzzdsqjjjlnyazphhyysrnqzthzhnyjyjhdzxzlswclybzyecwcycrylchzhzydz"
    "ydyjdfrjjhtrsqtxyxjrjhojyn"
    "xelxsfsfjzghpzsxzszdzcqzbyyklsgsjhczshdgqgxyzgxchxzjwyqwgyhksseqzzndzfkwys"
    "sdclzstsymcdhjxxyweyxczayd"
    "mpxmdsxybsqmjmzjmtjqlpjyqzcgqhyjhhhqxhlhdldjqcfdwbsxfzzyyschtytyjbhecxhjkg"
    "qfxbhyzjfxhwhbdzfyzbchpnpg"
    "dydmsxhkhhmamlnbyjtmpxejmcthqbzyfcgtyhwphftgzzezsbzegpbmdskftycmhbllhgpzjx"
    "zjgzjyxzsbbqsczzlzscstpgxm"
    "jsfdcczjzdjxsybzlfcjsazfgszlwbczzzbyztzynswyjgxzbdsynxlgzbzfygczxbzhzftpbg"
    "zgejbstgkdmfhyzzjhzllzzgjq"
    "zlsfdjsscbzgpdlfzfzszyzyzsygcxsnxxchczxtzzljfzgqsqqxcjqccccdjcdszzyqjccgxz"
    "tdlgscxzsyjjqtcclqdqztqchq"
    "qyzynzzzpbkhdjfcjfztypqyqttynlmbdktjcpqzjdzfpjsbnjlgyjdxjdcqkzgqkxclbzjtcj"
    "dqbxdjjjstcxnxbxqmslyjcxnt"
    "jqwwcjjnjjlllhjcwqtbzqqczczpzzdzyddcyzdzccjgtjfzdprntctjdcxtqzdtjnplzbcllc"
    "tdsxkjzqdmzlbznbtjdcxfczdb"
    "czjjltqqpldckztbbzjcqdcjwynllzlzccdwllxwzlxrxntqjczxkjlsgdnqtddglnlajjtnny"
    "nkqlldzntdnycygjwyxdxfrsqs"
    "tcdenqmrrqzhhqhdldazfkapbggpzrebzzykyqspeqjjglkqzzzjlysyhyzwfqznlzzlzhwcgk"
    "ypqgnpgblplrrjyxcccgyhsfzf"
    "wbzywtgzxyljczwhncjzplfflgskhyjdeyxhlpllllcygxdrzelrhgklzzyhzlyqszzjzqljzf"
    "lnbhgwlczcfjwspyxzlzlxgccp"
    "zbllcxbbbbnbbcbbcrnnzccnrbbnnldcgqyyqxygmqzwnzytyjhyfwtehznjywlccntzyjjcde"
    "dpwdztstnjhtymbjnyjzlxtsst"
    "phndjxxbyxqtzqddtjtdyztgwscszqflshlnzbcjbhdlyzjyckwtydylbnydsdsycctyszyyeb"
    "gexhqddwnygyclxtdcystqnygz"
    "ascsszzdzlcclzrqxyywljsbymxshzdembbllyyllytdqyshymrqnkfkbfxnnsbychxbwjyhtq"
    "bpbsbwdzylkgzskyghqzjxhxjx"
    "gnljkzlyycdxlfwfghljgjybxblybxqpqgntzplncybxdjyqydymrbeyjyyhkxxstmxrczzjwx"
    "yhybmcflyzhqyzfwxdbxbcwzms"
    "lpdmyckfmzklzcyqycclhxfzlydqzpzygyjyzmdxtzfnnyttqtzhgsfcdmlccytzxjcytjmksl"
    "pzhysnwllytpzctzccktxdhxxt"
    "qcyfksmqccyyazhtjplylzlyjbjxtfnyljyynrxcylmmnxjsmybcsysslzylljjgyldzdlqhfz"
    "zblfndsqkczfyhhgqmjdsxyctt"
    "xnqnjpyybfcjtyyfbnxejdgyqbjrcnfyyqpghyjsyzngrhtknlnndzntsmgklbygbpyszbydjz"
    "sstjztsxzbhbscsbzczptqfzlq"
    "flypybbjgszmnxdjmtsyskkbjtxhjcegbsmjyjzcstmljyxrczqscxxqpyzhmkyxxxjcljyrmy"
    "ygadyskqlnadhrskqxzxztcggz"
    "dlmlwxybwsyctbhjhcfcwzsxwwtgzlxqshnyczjxemplsrcgltnzntlzjcyjgdtclglbllqpjm"
    "zpapxyzlaktkdwczzbncctdqqz"
    "qyjgmcdxltgcszlmlhbglkznnwzndxnhlnmkydlgxdtwcfrjerctzhydxykxhwfzcqshknmqqh"
    "zhhymjdjskhxzjzbzzxympajnm"
    "ctbxlsxlzynwrtsqgscbptbsgzwyhtlkssswhzzlyytnxjgmjrnsnnnnlskztxgxlsammlbwld"
    "qhylakqcqctmycfjbslxclzjcl"
    "xxknbnnzlhjphqplsxsckslnhpsfqcytxjjzljldtzjjzdlydjntptnndskjfsljhylzqqzlbt"
    "hydgdjfdbyadxdzhzjnthqbykn"
    "xjjqczmlljzkspldsclbblnnlelxjlbjycxjxgcnlcqplzlznjtsljgyzdzpltqcssfdmnycxg"
    "btjdcznbgbqyqjwgkfhtnbyqzq"
    "gbkpbbyzmtjdytblsqmbsxtbnpdxklemyycjynzdtldykzzxtdxhqshygmzsjycctayrzlpwlt"
    "lkxslzcggexclfxlkjrtlqjaqz"
    "ncmbqdkkcxglczjzxjhptdjjmzqykqsecqzdshhadmlzfmmzbgntjnnlhbyjbrbtmlbyjdzxlc"
    "jlpldlpcqdhlhzlycblcxccjad"
    "qlmzmmsshmybhbnkkbhrsxxjmxmdznnpklbbrhgghfchgmnklltsyyycqlcskymyehywxnxqyw"
    "bawykqldnntndkhqcgdqktgpkx"
    "hcpdhtwnmssyhbwcrwxhjmkmzngwtmlkfghkjyldyycxwhyyclqhkqhtdqkhffldxqwytyydes"
    "bpkyrzpjfyyzjceqdzzdlattpb"
    "fjllcxdlmjsdxegwgsjqxcfbssszpdyzcxznyxppzydlyjccpltxlnxyzyrscyyytylwwndsah"
    "jsygyhgywwaxtjzdaxysrltdps"
    "syxfnejdxyzhlxlllzhzsjnyqyqyxyjghzgjcyjchzlycdshhsgczyjscllnxzjjyyxnfsmwfp"
    "yllyllabmddhwzxjmcxztzpmlq"
    "chsfwzynctlndywlslxhymmylmbwwkyxyaddxylldjpybpwnxjmmmllhafdllaflbnhhbqqjqz"
    "jcqjjdjtffkmmmpythygdrjrdd"
    "wrqjxnbysrmzdbyytbjhpymyjtjxaahggdqtmystqxkbtzbkjlxrbyqqhxmjjbdjntgtbxpgbk"
    "tlgqxjjjcdhxqdwjlwrfmjgwqh"
    "cnrxswgbtgygbwhswdwrfhwytjjxxxjyzyslphyypyyxhydqpxshxyxgskqhywbdddpplcjlhq"
    "eewjgsyykdpplfjthkjltcyjhh"
    "jttpltzzcdlyhqkcjqysteeyhkyzyxxyysddjkllpymqyhqgxqhzrhbxpllnqydqhxsxxwgdqb"
    "shyllpjjjthyjkyphthyyktyez"
    "yenmdshlzrpqfbnfxzbsftlgxsjbswyysksflxlpplbbblnsfbfyzbsjssylpbbffffsscjdst"
    "jsxtryjcyffsyzyzbjtlctsbsd"
    "hrtjjbytcxyyeylycbnebjdsysyhgsjzbxbytfzwgenhhhthjhhxfwgcstbgxklstyymtmbyxj"
    "skzscdyjrcythxzfhmymcxlzns"
    "djtxtxrycfyjsbsdyerxhljxbbdeynjghxgckgscymblxjmsznskgxfbnbbthfjyafxwxfbxmy"
    "fhdttcxzzpxrsywzdlybbktyqw"
    "qjbzypzjznjpzjlztfysbttslmptzrtdxqsjehbnylndxljsqmlhtxtjecxalzzspktlzkqqyf"
    "syjywpcpqfhjhytqxzkrsgtksq"
    "czlptxcdyyzsslzslxlzmacpcqbzyxhbsxlzdltztjtylzjyytbzypltxjsjxhlbmytxcqrblz"
    "ssfjzztnjytxmyjhlhpblcyxqj"
    "qqkzzscpzkswalqsplczzjsxgwwwygyatjbbctdkhqhkgtgpbkqyslbxbbckbmllndzstbklgg"
    "qkqlzbkktfxrmdkbftpzfrtppm"
    "ferqnxgjpzsstlbztpszqzsjdhljqlzbpmsmmsxlqqnhknblrddnhxdkddjcyyljfqgzlgsygm"
    "jqjkhbpmxyxlytqwlwjcpbmjxc"
    "yzydrjbhtdjyeqshtmgsfyplwhlzffnynnhxqhpltbqpfbjwjdbygpnxtbfzjgnnntjshxeawt"
    "zylltyqbwjpgxghnnkndjtmszs"
    "qynzggnwqtfhclssgmnnnnynzqqxncjdqgzdlfnykljcjllzlmzznnnnsshthxjlzjbbhqjwwy"
    "crdhlyqqjbeyfsjhthnrnwjhwp"
    "slmssgzttygrqqwrnlalhmjtqjsmxqbjjzjqzyzkxbjqxbjxshzssfglxmxnxfghkzszggslcn"
    "narjxhnlllmzxelglxydjytlfb"
    "kbpnlyzfbbhptgjkwetzhkjjxzxxglljlstgshjjyqlqzfkcgnndjsszfdbctwwseqfhqjbsaq"
    "tgypjlbxbmmywxgslzhglsgnyf"
    "ljbyfdjfngsfmbyzhqffwjsyfyjjphzbyyzffwotjnlmftwlbzgyzqxcdjygzyyryzynyzwega"
    "zyhjjlzrthlrmgrjxzclnnnljj"
    "yhtbwjybxxbxjjtjteekhwslnnlbsfazpqqbdlqjjtyyqlyzkdksqjnejzldqcgjqnnjsncmrf"
    "qthtejmfctyhypymhydmjncfgy"
    "yxwshctxrljgjzhzcyyyjltkttntmjlzclzzayyoczlrlbszywjytsjyhbyshfjlykjxxtmzyy"
    "ltxxypslqyjzyzyypnhmymdyyl"
    "blhlsyygqllnjjymsoycbzgdlyxylcqyxtszegxhzglhwbljheyxtwqmakbpqcgyshhegqcmwy"
    "ywljyjhyyzlljjylhzyhmgsljl"
    "jxcjjyclycjbcpzjzjmmwlcjlnqljjjlxyjmlszljqlycmmgcfmmfpqqmfxlqmcffqmmmmhnzn"
    "fhhjgtthxkhslnchhyqzxtmmqd"
    "cydyxyqmyqylddcyaytazdcymdydlzfffmmycqcwzzmabtbyctdmndzggdftypcgqyttssffwb"
    "dttqssystwnjhjytsxxylbyyhh"
    "whxgzxwznnqzjzjjqjccchykxbzszcnjtllcqxynjnckycynccqnxyewyczdcjycchyjlbtzyy"
    "cqwlpgpyllgktltlgkgqbgychj"
    "xy";

@implementation NSString (PinYin)

- (NSString *)getFirstLetter {
  NSString *words = [self
      stringByTrimmingCharactersInSet:[NSCharacterSet
                                          whitespaceAndNewlineCharacterSet]];
  if (words.length == 0) {
    return nil;
  }
  NSString *result = nil;
  unichar firstLetter = [words characterAtIndex:0];

  int index = firstLetter - HANZI_START;
  if (index >= 0 && index <= HANZI_COUNT) {
    result = [NSString stringWithFormat:@"%c", firstLetterArray[index]];
  } else if ((firstLetter >= 'a' && firstLetter <= 'z') ||
             (firstLetter >= 'A' && firstLetter <= 'Z')) {
    result = [NSString stringWithFormat:@"%c", firstLetter];
  } else {
    result = @"#";
  }
  return [result uppercaseString];
}

@end

@implementation NSArray (PinYin)

- (NSArray *)arrayWithPinYinFirstLetterFormat {
  if (![self count]) {
    return [NSMutableArray array];
  }

  NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  [dict setObject:[NSMutableArray array] forKey:@"#"];
  for (int i = 'A'; i <= 'Z'; i++) {
    [dict setObject:[NSMutableArray array]
             forKey:[NSString stringWithUTF8String:(const char *)&i]];
  }

  for (NSDictionary *words in self) {
    NSString *firstLetter = [words[@"name"] getFirstLetter];
    NSMutableArray *array = dict[firstLetter];
    [array addObject:words];
  }

  NSMutableArray *resultArray = [NSMutableArray array];
  for (int i = 'A'; i <= 'Z'; i++) {
    NSString *firstLetter = [NSString stringWithUTF8String:(const char *)&i];
    NSMutableArray *array = dict[firstLetter];
    if ([array count]) {
      [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDictionary *word1 = obj1;
        NSDictionary *word2 = obj2;
        return [word1[@"name"] localizedCompare:word2[@"name"]];
      }];
      NSDictionary *resultDict =
          @{ @"firstLetter" : firstLetter,
             @"content" : array };
      [resultArray addObject:resultDict];
    }
  }

  if ([dict[@"#"] count]) {
    NSMutableArray *array = dict[@"#"];
    [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
      NSDictionary *word1 = obj1;
      NSDictionary *word2 = obj2;
      return [word1[@"name"] localizedCompare:word2[@"name"]];
    }];
    NSDictionary *resultDict = @{ @"firstLetter" : @"#", @"content" : array };
    [resultArray addObject:resultDict];
  }
  return resultArray;
}

@end
