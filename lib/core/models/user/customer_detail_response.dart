// import 'package:networking/networking/serializable_object.dart';

// class CustomerDetailResponse
//     implements SerializableObject<CustomerDetailResponse> {
//   String responseCode;
//   String responseDescription;
//   NotificationPermissions notificationPermissions;
//   CustomerDetail customerDetail;

//   CustomerDetailResponse(
//       {this.responseCode, this.responseDescription, this.customerDetail});

//   CustomerDetailResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['ResponseCode'];
//     responseDescription = json['ResponseDescription'];
//     notificationPermissions = json['NotificationPermissions'] != null
//         ? new NotificationPermissions.fromJson(json['NotificationPermissions'])
//         : null;
//     customerDetail = json['customerDetail'] != null
//         ? new CustomerDetail.fromJson(json['customerDetail'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ResponseCode'] = this.responseCode;
//     data['ResponseDescription'] = this.responseDescription;
//     if (this.notificationPermissions != null) {
//       data['NotificationPermissions'] = this.notificationPermissions.toJson();
//     }
//     if (this.customerDetail != null) {
//       data['customerDetail'] = this.customerDetail.toJson();
//     }
//     return data;
//   }

//   @override
//   CustomerDetailResponse fromJson(Map<String, dynamic> json) {
//     return CustomerDetailResponse.fromJson(json);
//   }
// }

// class NotificationPermissions {
//   bool campaignPermission;
//   bool contestPermission;
//   bool priceChangePermission;
//   bool productPermission;
//   bool surveyPermission;

//   NotificationPermissions(
//       {this.campaignPermission,
//       this.contestPermission,
//       this.priceChangePermission,
//       this.productPermission,
//       this.surveyPermission});

//   NotificationPermissions.fromJson(Map<String, dynamic> json) {
//     campaignPermission = json['CampaignPermission'];
//     contestPermission = json['ContestPermission'];
//     priceChangePermission = json['PriceChangePermission'];
//     productPermission = json['ProductPermission'];
//     surveyPermission = json['SurveyPermission'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['CampaignPermission'] = this.campaignPermission;
//     data['ContestPermission'] = this.contestPermission;
//     data['PriceChangePermission'] = this.priceChangePermission;
//     data['ProductPermission'] = this.productPermission;
//     data['SurveyPermission'] = this.surveyPermission;
//     return data;
//   }
// }

// class CustomerDetail {
//   String address;
//   String airFilterDate;
//   String cardNumber;
//   int cardType;
//   String cityCode;
//   String countyCode;
//   double discountRate;
//   String email;
//   String fatherName;
//   int fuelTypeId;
//   String gasolineFilterDate;
//   int gender;
//   String inspectionDate;
//   bool isLCardApproved;
//   bool isMobileNumberEditable;
//   bool isPayAtPumpActive;
//   bool isPermitCommunication;
//   bool isVirtualCustomer;
//   String mobileNumber;
//   String name;
//   String oilFilterDate;
//   String selectedFuelTypes;
//   String surname;
//   String taxOffice;
//   String taxNumber;
//   String tCNumber;
//   String teamName;
//   double totalMoneyAmount;
//   double totalPointAmount;
//   String vehiclePlateNumber;
//   int vehicleTypeId;
//   String avatarUrl;

//   CustomerDetail(
//       {this.address,
//       this.airFilterDate,
//       this.cardNumber,
//       this.cardType,
//       this.cityCode,
//       this.countyCode,
//       this.discountRate,
//       this.email,
//       this.fatherName,
//       this.fuelTypeId,
//       this.gasolineFilterDate,
//       this.gender,
//       this.inspectionDate,
//       this.isLCardApproved,
//       this.isMobileNumberEditable,
//       this.isPayAtPumpActive,
//       this.isPermitCommunication,
//       this.isVirtualCustomer,
//       this.mobileNumber,
//       this.name,
//       this.oilFilterDate,
//       this.selectedFuelTypes,
//       this.surname,
//       this.tCNumber,
//       this.taxOffice,
//       this.taxNumber,
//       this.teamName,
//       this.totalMoneyAmount,
//       this.totalPointAmount,
//       this.vehiclePlateNumber,
//       this.vehicleTypeId,
//       this.avatarUrl});

//   CustomerDetail.fromJson(Map<String, dynamic> json) {
//     address = json['Address'];
//     // airFilterDate = CoreHelper.stringToDate4(json['AirFilterDate']);
//     cardNumber = json['CardNumber'];
//     cardType = json['CardType'];
//     cityCode = json['CityCode'];
//     countyCode = json['CountyCode'];
//     discountRate = json['DiscountRate'] == null
//         ? 0.0
//         : double.parse(json['DiscountRate'].toString());
//     email = json['Email'];
//     fatherName = json['FatherName'];
//     fuelTypeId = json['FuelTypeId'] is String
//         ? int.parse(json['FuelTypeId'])
//         : json['FuelTypeId'];
//     // gasolineFilterDate = CoreHelper.stringToDate4(json['GasolineFilterDate']);
//     gender = json['Gender'];
//     //inspectionDate = CoreHelper.stringToDate4(json['InspectionDate']);
//     isMobileNumberEditable = json['IsMobileNumberEditable'];
//     isLCardApproved = json['IsLCardApproved'];
//     isPayAtPumpActive = json['IsPayAtPumpActive'];
//     isPermitCommunication = json['IsPermitCommunication'];
//     isVirtualCustomer = json['IsVirtualCustomer'];
//     mobileNumber = json['MobileNumber'];
//     name = json['Name'];
//     //oilFilterDate = CoreHelper.stringToDate4(json['OilFilterDate']);
//     selectedFuelTypes = json['SelectedFuelTypes'];
//     surname = json['Surname'];
//     tCNumber = json['TCNumber'];
//     taxOffice = json['TaxOffice'];
//     taxNumber = json['TaxNumber'];
//     teamName = json['TeamName'];
//     totalMoneyAmount = json['TotalMoneyAmount'] == null
//         ? 0.0
//         : double.parse(json['TotalMoneyAmount'].toString());
//     totalPointAmount = json['TotalPointAmount'] == null
//         ? 0.0
//         : double.parse(json['TotalPointAmount'].toString());
//     vehiclePlateNumber = json['VehiclePlateNumber'];
//     vehicleTypeId = json['VehicleTypeId'];
//     avatarUrl = json['AvatarUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Address'] = this.address;
//     data['AirFilterDate'] = this.airFilterDate;
//     data['CardNumber'] = this.cardNumber;
//     data['CardType'] = this.cardType;
//     data['CityCode'] = this.cityCode;
//     data['CountyCode'] = this.countyCode;
//     data['DiscountRate'] = this.discountRate;
//     data['Email'] = this.email;
//     data['FatherName'] = this.fatherName;
//     data['FuelTypeId'] = this.fuelTypeId;
//     data['GasolineFilterDate'] = this.gasolineFilterDate;
//     data['Gender'] = this.gender;
//     data['InspectionDate'] = this.inspectionDate;
//     data['IsMobileNumberEditable'] = this.isMobileNumberEditable;
//     data['IsLCardApproved'] = this.isLCardApproved;
//     data['IsPayAtPumpActive'] = this.isPayAtPumpActive;
//     data['IsPermitCommunication'] = this.isPermitCommunication;
//     data['IsVirtualCustomer'] = this.isVirtualCustomer;
//     data['MobileNumber'] = this.mobileNumber;
//     data['Name'] = this.name;
//     data['OilFilterDate'] = this.oilFilterDate;
//     data['SelectedFuelTypes'] = this.selectedFuelTypes;
//     data['Surname'] = this.surname;
//     data['TCNumber'] = this.tCNumber;
//     data['TaxOffice'] = this.taxOffice;
//     data['TaxNumber'] = this.taxNumber;
//     data['TeamName'] = this.teamName;
//     data['TotalMoneyAmount'] = this.totalMoneyAmount;
//     data['TotalPointAmount'] = this.totalPointAmount;
//     data['VehiclePlateNumber'] = this.vehiclePlateNumber;
//     data['VehicleTypeId'] = this.vehicleTypeId;
//     data['AvatarUrl'] = this.avatarUrl;
//     return data;
//   }
// }
