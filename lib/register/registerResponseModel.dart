class RegisterResponseModel {
    final bool status;
    final String message;

    RegisterResponseModel({
        required this.status,
        required this.message,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        status: json["status"],
        message: json["message"],
    );

   
}