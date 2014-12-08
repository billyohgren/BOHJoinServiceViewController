This is a work in progress!

How to use:
- Initialize the view controller with the providers you would like to support.
´´´BLVLoginSignUpViewController *vc = [[BLVLoginSignUpViewController alloc] initWithProvider:BLVLoginSignupProviderEmail |
BLVLoginSignupProviderFacebook];´´´

Styling:
Create a NSDictionary with the option keys defined inside ´´´BLVLoginSignupDataTypes´´´ and set the options property on the view controller.