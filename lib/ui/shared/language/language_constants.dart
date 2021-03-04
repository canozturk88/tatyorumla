import 'package:flutter/material.dart';

class LanguageConstants extends InheritedWidget {
  static LanguageConstants of(BuildContext context) =>
      // ignore: deprecated_member_use
      context.inheritFromWidgetOfExactType(LanguageConstants);

  const LanguageConstants({Widget child, Key key}) : super(key: key, child: child);

  final String deneme = 'deneme';

  final String profileInfo = 'profileInfo';
  final String vehicleInfo = 'vehicleInfo';
  final String changePassword = 'changePassword';
  final String notificationConfig = 'notificationConfig';
  final String congratulations = 'congratulations';
  final String error = 'error';
  final String info = 'info';
  final String notificationConfigInfo = 'notificationConfigInfo';

  final String tckn = 'tckn';
  final String cardNumber = 'cardNumber';
  final String name = 'name';
  final String surname = 'surname';
  final String phone = 'phone';
  final String idNumber = 'idNumber';
  final String vknNumber = 'vknNumber';
  final String mail = 'mail';
  final String plate = 'plate';
  final String address = 'address';
  final String taxOffice = 'taxOffice';
  final String save = 'save';
  final String month = 'month';
  final String year = 'year';

  final String warningTcknVknControl = 'warningTcknVknControl';
  final String warningTckn10Empty = 'warningTckn10Empty';
  final String warningVkn10Empty = 'warningVkn10Empty';
  final String warningTaxOfficeEmpty = 'warningTaxOfficeEmpty';

  final String general = 'general';
  final String vehiclePageInfo = 'vehiclePageInfo';
  final String vehicleType = 'vehicleType';
  final String fuelType = 'fuelType';
  final String currentPassword = 'currentPassword';
  final String newPassword = 'newPassword';
  final String againPassword = 'againPassword';
  final String infoPassword = 'infoPassword';

  final String inspectionTime = 'inspectionTime';
  final String oilFilterDate = 'oilFilterDate';
  final String airFilterDate = 'airFilterDate';
  final String gasolineFilterDate = 'gasolineFilterDate';

  final String transactionHistory = 'transactionHistory';
  final String enterMessage = 'enterMessage';
  final String headquarters = 'headquarters';
  final String contactPhone = 'contactPhone';
  final String contactFax = 'contactFax';
  final String showOnMap = 'showOnMap';
  final String customerInformation = 'customerInformation';
  final String contactAddress = 'contactAddress';

  final String enterCustomCode = 'enterCustomCode';
  final String infoCode = 'infoCode';
  final String finishButton = 'finishButton';
  final String okButton = 'okButton';
  final String turnMainPage = 'turnMainPage';

  final String faqSearchHint = 'faqSearchHint';
  final String noNews = 'noNews';
  final String changePhoto = 'changePhoto';
  final String account = 'account';
  final String infoQrCode = 'infoQrCode';
  final String openCamera = 'openCamera';
  final String addedPhoto = 'addedPhoto';
  final String addPhoto = 'addPhoto';
  final String nameSurname = 'nameSurname';
  final String aytemizCardNumber = 'aytemizCardNumber';
  final String explanation = 'explanation';
  final String sent = 'sent';

  final String confirmationSms = 'confirmationSms';
  final String confirmationEmail = 'confirmationEmail';
  final String confirmationKvk = 'confirmationKvk';
  final String suggestionInfo = 'suggestionInfo';

  final String surveysTopInfo = 'surveysTopInfo';
  final String chooseDate = 'chooseDate';
  final String surveyIsRequired = 'surveyIsRequired';
  final String surveySubmitSuccess = 'surveySubmitSuccess';

  final String send = 'send';

  final String welcomeText = 'welcomeText';
  final String infoLogin = 'infoLogin';
  final String loginCardPhone = 'loginCardPhone';
  final String password = 'password';
  final String loginActiveQuestion = 'loginActiveQuestion';
  final String loginForgetPasswordQuestion = 'loginForgetPasswordQuestion';
  final String loginNewPassword = 'loginNewPassword';

  final String warningMust10CharPhone = 'warningMust10CharPhone';
  final String warningEmptyMail = 'warningEmptyMail';
  final String warningInvalidPhone = 'warningInvalidPhone';
  final String warningControlMail = 'warningControlMail';
  final String warningEmptyName = 'warningEmptyName';
  final String warningEmptyNameSurname = 'warningEmptyNameSurname';
  final String warningOnlyTextNameSurname = 'warningOnlyTextNameSurname';
  final String warningPlate = 'warningPlate';
  final String warningControlPlate = 'warningControlPlate';
  final String warningOnlyTextName = 'warningOnlyTextName';
  final String warningEmptySurname = 'warningEmptySurname';
  final String warningOnlyTextSurname = 'warningOnlyTextSurname';
  final String search = 'search';
  final String search2 = 'search2';
  final String distance = 'distance';
  final String stationProperties = 'stationProperties';
  final String stationList = 'stationList';
  final String paymentSelection = 'paymentSelection';
  final String vehiclePay = 'vehiclePay';
  final String mobilePayment = 'mobilePayment';
  final String mobilePayment2 = 'mobilePayment2';
  final String noCampaign = 'noCampaign';
  final String campaignDetailButtonText = 'campaignDetailButtonText';
  final String updateCard = 'updateCard';
  final String cutOffDate = 'cutOffDate';
  final String maxPayment = 'maxPayment';
  final String saveCard = 'saveCard';
  final String saveCardInfo = 'saveCardInfo';
  final String saveCardInfo2 = 'saveCardInfo2';
  final String myCards = 'myCards';
  final String infoMyCards = 'infoMyCards';
  final String infoMyCardsVehicle = 'infoMyCardsVehicle';
  final String addNewCard = 'addNewCard';
  final String addCard = 'addCard';
  final String removeCardQuestion = 'removeCardQuestion';
  final String removeCardAnswer = 'removeCardAnswer';
  final String infoCardList = 'infoCardList';
  final String codeOperations = 'codeOperations';
  final String toReturn = 'toReturn';
  final String spending = 'spending';
  final String allOf = 'allOf';
  final String addBalance = 'addBalance';
  final String createCode = 'createCode';
  final String mobileWallet = 'mobileWallet';
  final String walletOperation = 'walletOperation';
  final String transactionDetail = 'transactionDetail';
  final String fuelIntake = 'fuelIntake';
  final String infoAllTransaction = 'infoAllTransaction';
  final String paycellCards = 'paycellCards';
  final String addPaycellCard = 'addPaycellCard';
  final String infoPaycellCard = 'infoPaycellCard';
  final String infoPayment = 'infoPayment';
  final String infoPayment2 = 'infoPayment2';
  final String change = 'change';
  final String loadBalanceAytemizWallet = 'loadBalanceAytemizWallet';
  final String navigateToCodeCreationPage = 'navigateToCodeCreationPage';
  final String infoPaymentCode = 'infoPaymentCode';
  final String copied = 'copied';
  final String infoPaymentCode2 = 'infoPaymentCode2';
  final String infoFuelAmount = 'infoFuelAmount';
  final String infoPaymentCode3 = 'infoPaymentCode3';
  final String createPaymentCodeText = 'createPaymentCodeText';
  final String weather = 'weather';
  final String yourPoint = 'yourPoint';
  final String campaigns = 'campaigns';

  final String withoutSelectionContinue = 'withoutSelectionContinue';
  final String vehicleSelection = 'vehicleSelection';
  final String gasoline = 'gasoline';
  final String diesel = 'diesel';
  final String lpg = 'lpg';
  final String electric = 'electric';
  final String customizeYourApp = 'customizeYourApp';
  final String infoCustomize = 'infoCustomize';

  final String time = 'time';
  final String showDetail = 'showDetail';
  final String readAndUnderstand = 'readAndUnderstand';
  final String direction = 'direction';

  final String station = 'station';
  final String fuelAmount = 'fuelAmount';
  final String literPrice = 'literPrice';
  final String payment = 'payment';

  final String errorText = 'errorText';

  final String close = 'close';
  final String createCard = 'createCard';
  final String defineCard = 'defineCard';
  final String infoCreateVirtualCard = 'infoCreateVirtualCard';
  final String infoConfirmationGeneral = 'infoConfirmationGeneral';
  final String infoConfirmationKvk = 'infoConfirmationKvk';

  final String chooseCity = 'chooseCity';
  final String chooseCounty = 'chooseCounty';

  final String login = 'login';
  final String register = 'register';
  final String editAccount = 'editAccount';
  final String myAytemizCard = 'myAytemizCard';
  final String fuelPrices = 'fuelPrices';
  final String news = 'news';
  final String notifications = 'notifications';
  final String enterCode = 'enterCode';
  final String qrCode = 'qrCode';
  final String campaignQrCode = 'campaignQrCode';
  final String aytemizBot = 'aytemizBot';
  final String faq = 'faq';
  final String suggestionAndComplaint = 'suggestionAndComplaint';
  final String aytFormTitle = 'aytFormTitle';
  final String surveys = 'surveys';
  final String contact = 'contact';
  final String vaayOnboarding = 'vaayOnboarding';
  final String logout = 'logout';
  final String vaayCampaign = 'vaayCampaign';

  final String afterLooking = 'afterLooking';
  final String vaayNow = 'vaayNow';
  final String vaayExist = 'vaayExist';

  final String convertPointInfoText = 'convertPointInfoText';

  final String errorAddCard = 'errorAddCard';
  final String errorAddCard2 = 'errorAddCard2';
  final String errorAddCard3 = 'errorAddCard3';
  final String errorGeneral = 'errorGeneral';
  final String errorUnSupportQR = 'errorUnSupportQR';
  final String errorFetchInfo = 'errorFetchInfo';

  final String warningEmptyCardNumber = 'warningEmptyCardNumber';
  final String warningEmptyPhone = 'warningEmptyPhone';
  final String warning16CharCardNumber = 'warning16CharCardNumber';
  final String warningEmptyMonth = 'warningEmptyMonth';
  final String warningControlMonth = 'warningControlMonth';
  final String warningEmptyYear = 'warningEmptyYear';
  final String warningEmptyCvc2 = 'warningEmptyCvc2';
  final String warningEmptyCutOffDate = 'warningEmptyCutOffDate';
  final String warningControlCutOffDate = 'warningControlCutOffDate';
  final String warningEmptyMaxAmount = 'warningEmptyMaxAmount';
  final String warningMinValueMaxAmount = 'warningMinValueMaxAmount';
  final String warningChoosePaymentType = 'warningChoosePaymentType';
  final String warningControlAmount = 'warningControlAmount';
  final String warningMinValue = 'warningMinValue';
  final String warningInsufficientValue = 'warningInsufficientValue';
  final String warningEmptyCode = 'warningEmptyCode';
  final String warningEmptyFuelType = 'warningEmptyFuelType';
  final String warningEmptyFuelType2 = 'warningEmptyFuelType2';
  final String warningEmptyCity = 'warningEmptyCity';
  final String warningEmptyCounty = 'warningEmptyCounty';
  final String warningPhone0Control = 'warningPhone0Control';
  final String warningEmpty = 'warningEmpty';
  final String warningCamera = 'warningCamera';
  final String warningEmptyUserInfos = 'warningEmptyUserInfos';
  final String warningLocationPermission = 'warningLocationPermission';
  final String warningOpenGps = 'warningOpenGps';
  final String warningEmptyPasswords = 'warningEmptyPasswords';
  final String warningWrongOldPasswords = 'warningWrongOldPasswords';
  final String warningMin6CharPasswords = 'warningMin6CharPasswords';
  final String warningMustSameNewPasswords = 'warningMustSameNewPasswords';
  final String warningChooseCategory = 'warningChooseCategory';
  final String warningEmptyKvk = 'warningEmptyKvk';
  final String warningEmptyDesc = 'warningEmptyDesc';
  final String warningChoseCategory = 'warningChoseCategory';
  final String warningComplaint = 'warningComplaint';
  final String warningRequest = 'warningRequest';
  final String warningThank = 'warningThank';
  final String warningProposal = 'warningProposal';
  final String warningFuelTypeSave = 'warningFuelTypeSave';
  final String warningTcControl = 'warningTcControl';
  final String warningCityCountyEmpty = 'warningCityCountyEmpty';

  final String infoCopiedCode = 'infoCopiedCode';
  final String infoGeneral = 'infoGeneral';
  final String infoKvk = 'infoKvk';
  final String infoSuccessRegister = 'infoSuccessRegister';
  final String infoSuccessTransaction = 'infoSuccessTransaction';
  final String infoReceivedNewCampaign = 'infoReceivedNewCampaign';
  final String infoViewDetail = 'infoViewDetail';
  final String infoReceivedNews = 'infoReceivedNews';
  final String infoViewNewDetail = 'infoViewNewDetail';
  final String infoCanceled = 'infoCanceled';
  final String infoCancel = 'infoCancel';
  final String infoTimedOut = 'infoTimedOut';
  final String infoUpdatedPassword = 'infoUpdatedPassword';
  final String infoSendForm = 'infoSendForm';

  final String aytemizCard = 'aytemizCard';
  final String pointsEarned = 'pointsEarned';
  final String pointsSpent = 'pointsSpent';
  final String discountAmount = 'discountAmount';
  final String lastJoin = 'lastJoin';
  final String viewCode = 'viewCode';
  final String viewThisCode = 'viewThisCode';
  final String viewCampaignCode = 'viewCampaignCode';
  final String sendMessage = 'sendMessage';
  final String stations = 'stations';
  final String paycellCard = 'paycellCard';
  final String choose = 'choose';
  final String gallery = 'gallery';
  final String camera = 'camera';

  final String openMapGoogle = 'openMapGoogle';
  final String openMapYandex = 'openMapYandex';
  final String openMapApple = 'openMapApple';
  final String cancel = 'cancel';

  final String configCampaign = 'configCampaign';
  final String configChangePrice = 'configChangePrice';
  final String configProducts = 'configProducts';
  final String configSurveys = 'configSurveys';
  final String configCompetition = 'configCompetition';

  final String noNotification = 'noNotification';

  final String vaay_name_surname = 'vaay_name_surname';
  final String vaay_person = 'vaay_person';
  final String vaay_mail = 'vaay_mail';
  final String vaay_phone = 'vaay_phone';
  final String vaay_vehicle_count = 'vaay_vehicle_count';
  final String vaay_consumption = 'vaay_consumption';
  final String vaay_tckn_vkn = 'vaay_tckn_vkn';
  final String vaay_tax_administration = 'vaay_tax_administration';
  final String vaay_message = 'vaay_message';
  final String vaay_address = 'vaay_address';
  final String vaay_device_address = 'vaay_device_address';

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
