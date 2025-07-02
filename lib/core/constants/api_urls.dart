class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  static const String _baseURL = "https://backend.khabaar.food/api/v1";
  static const String _imageBaseURL = "https://pub-fd7ac8a0bbb44eb78df5ac30521bf4ed.r2.dev/";

  // Products Endpoints
  static String categories = "/productCategory/getAllProductCategory";
  static String categoriesFood = "/product/allProductCustomer?";
  static String foods = "/product/getAllRecommendedProduct?page=";
  static String allRecipes = "/product/allProductCustomer?page=";
  static String instantRecipes = "/product/allProductCustomer?parent_category=instant&page=";
  static String scheduleRecipes = "/product/allProductCustomer?parent_category=schedule&page=";
  static String coupons = "/coupon/getClaimedAndOngoingCoupon";
  static String claimedCoupon = "/coupon/orderCoupons/";
  static String filterData = "/product/productFilter";
  static String searchAndFilter = "/product/allProductCustomer?";

  static String campaignDetails = "/campaign/getSingle/";
  static String allCampaign = "/campaign/getAll";

  static String signUp  = "/customer/customerAuth";
  static String otpVerify  = "/customer/verifyOtp";

  static String profileInfo  = "/customer/getSingleCustomer/";
  static String updateProfile  = "/customer/updateCustomer/";

  static String orderAddresses  = "/customer/getCustomerAddress/";
  static String addNewOrderAddress  = "/customer/addNewAddress/";
  static String deleteOrderAddress  = "/customer/deleteCustomerAddress/";
  static String updateOrderAddress  = "/customer/updateCustomerAddress/";

  static String notification = "/notification/getAllCustomerNotification/";

  static String details = "/product/RecommandedSingleProduct/";
  static String recommendedFoods = "/product/allProductCustomer?categoryName=";

  static String kitchenFoods = "/product/getSellerProduct/";

  static String deliveryCharge = "/order/orderDeliveryCharge";

  static String createOrder = "/order/createOrder";
  static String verifyCoupon = "/coupon/verifyCoupon/";
  static String orders = "/customer/getCustomerOrder/";
  static String cancelOrder = "/order/updateOrder/";

  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

}

