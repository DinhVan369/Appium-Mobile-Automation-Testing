1.Thông tin các thành viên trong nhóm
- Trần Quang Đãng       52100174
- Trương Đình Văn       52100369
- Nguyễn Thị Hồng Hạnh  52100791



2.Hướng dẫn chạy chương trình step-by-step
Chạy Chương Trình Kiểm Thử với Robot Framework và Appium

Hướng dẫn này sẽ giúp bạn cài đặt và chạy các chương trình kiểm thử sử dụng Robot Framework và Appium. Nó bao gồm các hướng dẫn về cài đặt các thư viện cần thiết và chạy các test case nằm trong các thư mục riêng biệt.

Yêu Cầu

Đảm bảo rằng bạn đã cài đặt các phần mềm sau trên hệ thống của mình:
- Python
- pip
- Android Studio (để cài đặt Android SDK và các công cụ cần thiết)
- Node.js và npm (trình quản lý gói của Node.js)
- Appium

Cài Đặt
1. Cài đặt Robot Framework:
   pip install robotframework
2. Cài đặt Appium Library cho Robot Framework:
   pip install robotframework-appiumlibrary

3. Cài đặt Android Studio:
   - Tải và cài đặt Android Studio từ trang chính thức: https://developer.android.com/studio
   - Cài đặt Android SDK và các công cụ cần thiết trong Android Studio.

4. Cài đặt Node.js và npm:
   - Tải và cài đặt từ trang chính thức: https://nodejs.org/

5. Cài đặt Appium:
    - Sử dụng npm để cài đặt Appium:
        npm install -g appium
    - Kiểm tra cài đặt Appium:
        appium -v
    - Cài đặt driver cho Android:
        appium driver install uiautomator2
 


Cấu Trúc Thư Mục
Cấu trúc dự án của  như sau:

source/
├── Login function/
│   ├── log.html
│   ├── login.robot
│   ├── output.xml
│   └── report.html
├── Register function/
│   ├── log.html
│   ├── register.robot
│   ├── output.xml
│   └── report.html
└── resources/
    └── resources.robot

Chạy Các Kiểm Thử
1. Khởi chạy Android Studio:
   Mở Project bằng cách chọn Open và tìm đến thư mục android-login-and-registration-sample.
   Nhấn Run app để tiến hành bắt đầu kiểm thử. Android Studio sẽ tự động cài và chạy App trên Device.
   Nếu Device không được cài đặt sẵn khi chạy có thể thêm Device tại cửa sổ Device Manager -> Chọn Add a new Device
   Device mà nhóm tiến hành kiểm thử là Pixel 3a API 34, với image là UpsideDownCake, phiên bản Android 14.

2. Khởi động Appium Server:
   Mở terminal và chạy lệnh:
   appium --allow-cors hoặc appium
   
3.Điều chỉnh url Appium Server trong file resources.robot
    `${APP_URL}    http://192.168.1.15:4723`
    Địa chỉ này là địa chỉ của Appium Server có thể thay đổi tùy theo cấu hình của bạn hoặc được cung cấp ở terminal appium.
    
    `
        [Appium] You can provide the following URLS in your client code to connect to this server:
        [Appium]        http://192.168.1.15:4723/
        [Appium]        http://127.0.0.1:4723/ (only accessible from the same host)
    `


4. Điều hướng đến thư mục chứa test case:
   Vào thư mục chứa test case bạn muốn chạy. Ví dụ, để chạy test trong thư mục test_case_folder_1:
   cd my_test_project/test_case_folder_1

5. Chạy test case:
   Sử dụng lệnh robot kèm theo tên tệp test case. Ví dụ:
   robot test_case_1.robot
   Hoặc có thể dùng Ride một Robotframework UI để chạy test cases bằng cách gõ lệnh ride.py và tìm đến thư mục chứa test cases muốn chạy.
   Hoặc có thể trực tiếp nhấp vào file .robot để chạy test cases.


Lưu Ý Quan Trọng
Sẽ có một số test case bị chính nhóm chủ đích đánh FAIL và đưa ra thông báo. Nếu test case FAIL vì lỗi, hãy thử chạy từng test case và đảm bảo rằng đường truyền mạng ổn định.

Ví Dụ Test Case

Dưới đây là ví dụ về một test case đơn giản (test_case_1.robot):

*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Open app
Suite Teardown    Close Application
*** Variables ***
&{USER1_UPPERCASE}    email=DINHVAN@GMAIL.COM    password=VAN123
&{USER1_LOWERCASE}    email=dinhvan@gmail.com    password=van123
&{USER1_SC}    email=Dinhv#n@gmail.com    password=V#n123

*** Test Cases ***
Login with valid username and password
    # Go to register to register a valid account (user1)
    Go to register
    . . . . . . . .

Tài Nguyên Bổ Sung

- Robot Framework User Guide: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
- Appium Documentation: https://appium.io/docs/en/latest/intro/
- Robot Framework Appium Library: https://github.com/serhatbolsu/robotframework-appiumlibrary

Khắc Phục Sự Cố
- Đảm bảo rằng tất cả các đường dẫn đều đúng và các thư viện đã được cài đặt.
- Kiểm tra cấu hình Android Emulator trong Android Studio.

Nếu gặp bất kỳ vấn đề nào, tham khảo Hướng Dẫn Khắc Phục Sự Cố của Robot Framework: https://www.nrtcautomation.com/blog/how-to-troubleshoot-a-robot
