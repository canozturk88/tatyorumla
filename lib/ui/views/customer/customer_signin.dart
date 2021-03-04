import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/models/user/customer.dart';
import '../../shared/styles/colors.dart';
import '../../shared/view_helper/ui_helper.dart';
import 'customer_login_view.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  final customer = Customer('', '', '', '');
  bool isKvkk = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _helloText,
                _description,
                _formField,
                _signup,
                _getkvkk(),
                link(),
                _loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _signup => Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_context) => CustomerLoginView()));
                },
                child: Text(UIHelper.haveAnAccount, style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            )),
      );

  Widget get _formField => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                _textFielCustomeName(
                  UIHelper.nameSurname,
                  false,
                ),
                _textFieldEmail(
                  UIHelper.email,
                  false,
                ),
                // _textFieldPhone(UIHelper.phone, true),
                _textFieldPassword(UIHelper.password, true),
              ],
            ),
          ),
        ),
      );

  Widget _textFielCustomeName(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          // obscureText: obscure,
          autocorrect: false,
          validator: validateFirtsName,
          onSaved: (String value) {
            customer.nameSurname = value;
          },
          cursorColor: Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _textFieldEmail(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          // obscureText: obscure,
          autocorrect: false,
          validator: validateEmail,
          onSaved: (String value) {
            customer.mailAddress = value;
          },
          cursorColor: Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.email),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _textFieldPassword(String text, bool obscure) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          validator: validatePassword,
          onSaved: (String value) {
            customer.password = value;
          },
          cursorColor: Colors.white,
          maxLines: 1,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.vpn_key),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget get _description => Text(UIHelper.signUpAccount, style: _helloTextStyle(30));

  Widget get _loginButton => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          borderRadius: _loginButtonBorderStyle,
          onTap: () {
            if (formKey.currentState.validate()) {
              if (isKvkk) {
                formKey.currentState.save();
                customer.isKvkk = true;
                saveCustomer(customer);
              } else {
                _showDialogkVkk('Kvkk Onaylamaniz Gerekmektedir', true);
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: _loginButtonBorderStyle),
            height: UIHelper.dynamicHeight(200),
            width: UIHelper.dynamicWidth(1000),
            child: Center(
              child: Text(
                UIHelper.signUp,
                style: TextStyle(
                  color: mainColor,
                  fontSize: UIHelper.dynamicSp(40),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _helloText => Text(UIHelper.hello, style: _helloTextStyle(70));

  Widget emailNameField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'E-Mail', hintText: 'mail@mail.com'),
      validator: validateEmail,
      onSaved: (String value) {
        customer.mailAddress = value;
      },
    );
  }

  Widget _getkvkk() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CheckboxListTile(
        onChanged: (a) {
          setState(() {
            isKvkk = !isKvkk;
          });
        },
        value: isKvkk,
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: Colors.red,
        title: Text(
          'Tadayım Bunu tarafından kişişel verilerimin işlenmesini ve ticari elektronik ileti almayı kabul ederek açık rıza veriyorum.',
          style: TextStyle(
              //  fontWeight: FontWeight.bold,
              color: Colors.white,
              //decoration: TextDecoration.underline,
              fontSize: 12.0),
        ),
      ),
    );
  }

  Widget link() {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: () {
            _showDialogKvkk();
            //  Navigator.pushNamed(context, MyNotice.routeName);
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Aydınlatma metni için tıklayınız.',
              textAlign: TextAlign.right,
              style: TextStyle(
                  //  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                  decoration: TextDecoration.underline,
                  fontSize: 15.0),
            ),
          ),
        ));
  }

  Widget passwordNameField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Şifre', hintText: 'Şifre'),
    );
  }

  TextStyle _helloTextStyle(double fontSize) => TextStyle(
        color: Colors.white,
        fontSize: UIHelper.dynamicSp(fontSize),
        fontWeight: FontWeight.bold,
      );
  BorderRadius get _loginButtonBorderStyle => BorderRadius.only(
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        topLeft: Radius.circular(20),
      );

  Future<void> saveCustomer(Customer customer) async {
    var isConncet = false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConncet = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConncet = true;
    }
    if (isConncet) {
      // AccountApiServices.createUser(user).then((response) {
      //   setState(() {
      //     if (response.statusCode == 201) {

      //       _showDialog(
      //           "Kayıdınız alındı. Lütfen mail adresinize gelen e-postayı onaylayınız.",
      //           true);
      //     } else {
      //       _showDialog(
      //           "Aynı mail adresi veya telefon numarasına ait kayıt vardır.",
      //           true);
      //     }
      //   });
      // });
    } else {
      _showDialog('Lütfen internet bağlantınızı kontrol ediniz.', false);
    }
  }

  void _showDialogKvkk() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'MOBİL UYGULAMA KULLANICI SÖZLEŞMESİ ',
            style: TextStyle(fontWeight: FontWeight.bold, color: mainColor, fontSize: 12.0),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: SingleChildScrollView(
              child: Text(
                'Gizlilik Politikası ve Kullanım Koşulları\n\nBurada belirtilen gizlilik politikası '
                "ve kullanım koşulları; TAT YORUMLA'n Google Play Store ve IOS App Store'da yayınlanan"
                ' bütün mobil uygulamaları için geçerlidir. Bu uygulamaları mobil cihazınıza yükleyerek, '
                'bu metinde yer alan gizlilik politikasını ve kullanım koşullarını kabul etmiş sayılırsınız.'
                ' Bu koşulları kabul etmiyorsanız bu uygulamaları mobil cihazınıza yüklemeyiniz \n\n'
                'Uygulamalarımızda, Girilen Veriler şifreli sunucularda sadece sizlerin görebileceği şekilde depolanır ve 3. şahıs yada kurumlar ile paylaşılmaz. '
                'Telefon Kullanım İzinleri,Uygulamımızdan bulunan kısayol arama işlemi için gerekli olan izinlerin tarafınızdan sağlanmış olması gerekir.Verilen bu izin sadece Uygulamadas kayıtlı olan müşterilerinizin kısayol aramlarında kullanılmaktadır ve müşterilerinize ait kişisel veriler sadece size özel veritabnlarında şifreli olarak saklanır.'
                '\n\n İnternet Kullanım İzinleri,Uygulamımızdan Verilerin Şifreli sunuculara gönderilebilmesi için gerekli olan izindir ve kullanıcıların bunu tanımlaması gerekir. bu izinler telefonunuzdan isteğiniz dışında bir bilgiyi transfer etmek için kullanılmaz. Verilen internet erişim izni sadece uygulama içersinde dolduracağınız formlara ait veri ve fotoğraf transferi için kullanılmaktadır. '
                '\n\n Kamera Kullanımı: Mobil Uygulamalarımızda kamera kullanımı sadece uygulama içersinden göndermek istediğiniz fotoğraflar için kullanılmaktadır. kullanıcı bilgisi dışında kullanımı söz konusu değildir. Mobil uygulamada çekilen fotoğraflar kullanıcıya ait şifreli ortamda saklanır ve sadece kendisinin ve bağlı olduğu kurumun erişimine açıktır. Fotoğraflar 3. şahıs yada kurumlar ile kullanıcı bilgisi dışında paylaşılmaz. '
                '\n\n Uygulamalarımız, size ait herhangi bir kişisel bilgiyi toplamaz ve sizden bu yönde bir talepte bulunmaz. '
                "\n\n TAT YORUMLA, kaliteli ve yararlı uygulamalar yayınlamak için her zaman gereken özeni ve duyarlılığı gösterecektir. Buna rağmen, uygulamalarımızda yer alan içeriklerin beklentilerinizi karşılayacağı, size yararlı olacağı veya kesin doğru bilgiler içereceğine dair hiçbir taahhütte bulunmamaktayız. Uygulamaları olduğu gibi sunmaktayız. Bu sebeple, uygulamalarımızdan kaynaklı yaşanacak herhangi bir olumsuz durum için TAT YORUMLA'yi sorumlu tutamayacağınızı kabul etmektesiniz. "
                '\n\n TAT YORUMLA, bu uygulamaların güvenliği konusunda alınabilecek tüm önlemleri almak için gereken ölçüde çaba sarf eder ve Google Play Geliştirici Programı Politikaları sözleşmesi kapsamındaki yükümlülüklerini yerine getirir. Bununla birlikte; internet ve dijital ortamlar yeterli düzeyde güvenli alanlar değildir. Bu yüzden size yüzde yüz güvenli bir hizmet sunacağımız konusunda herhangi bir garantide bulunmamaktayız. '
                "\n\n Uygulamalarımız sadece Google Play Store ve IOS App Store'da yer almaktadır. Bu uygulamaların bizim bilgimiz dışında başka bir android yada IOS mağazasında yer alması durumunda, buradan yapılacak yüklemelerden TAT YORUMLA sorumlu tutulamaz."
                "\n\n Bu uygulamalarda, üçüncü taraflara ait reklamlar ve linkler yer alabilir. Bu üçüncü taraflara ait reklamların ve linklerin niteliğinden, içeriğinden, güvenliğinden veya bunlardan kaynaklı oluşabilecek zararlardan TAT YORUMLA'yı sorumlu tutamayacağınızı kabul etmektesiniz. Google tarafından yayınlanan reklamlara ilişkin ayarlarınızı nasıl düzenleyeceğinizi, reklam ayarları sayfasından öğrenebilirsiniz. "
                '\n\n Bu uygulamalarda yer alan sesli, yazılı ve görsel öğelerden ve yazılımlardan oluşan bütün içeriğe ilişkin her türlü telif hakkı TAT YORUMLA’ya aittir. Herhangi bir uygulamamızı veya bu uygulamaların telif haklarıyla korunan içeriğini; kopyalama, çoğaltma, yeniden yayımlama, parçalarına ayırma, tekrar kamuya sunma vb. eylemlerde bulunmayacağınızı kabul etmektesiniz. '
                '\n\n Burada belirtilen koşullarla ilgili görüş ve önerilerinizi, info@komutteknolojisi.com mail adresinden bize iletebilirsiniz.'
                "\n\n TAT YORUMLA; bu Gizlilik Politikası ve Kullanım Koşulları metninde değişiklik yapabilir. Yapılan değişiklikler anında yürürlüğe girecektir. Değişiklik yaptığımız tarihi, 'son güncelleme tarihi' olarak en alt kısımda belirtiriz."
                '\n\n Son güncelleme tarihi:'
                '\n\18.11.2020',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 10.0),
              ),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CustomerLogin()));
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(String contextText, bool isuscces) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildiri'),
          content: Text(contextText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text('Kapat'),
              onPressed: () {
                if (isuscces) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/customerLogin');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogkVkk(String contextText, bool isuscces) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildiri'),
          content: Text(contextText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text('Kapat'),
              onPressed: () {
                if (isuscces) {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pushNamed("/customerLogin");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
