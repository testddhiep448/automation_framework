# Created by Do Duc Hiep
==========================

# Please follow below step to setup automation framework locally with ruby for window 10

## STEP1: Install Ruby 2.6.6, MSYS2 and MINGW for window 10
    1.1. Download and install Ruby via https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-2/rubyinstaller-2.6.6-2-x86.exe
    1.2. After Ruby installation, you will be required to install MSYS2. Please type 3 then press ENTER to install 'MSYS2 and MINGW development toolchain'
    1.3. Add ruby path to global environment variables of your PC/Laptop

## STEP2: Install required packages
    2.1. Clone repository to you PC/Laptop
    2.2. Open CMD and navigate to local repository "automation_framework" on you PC/Laptop
    2.3. Run command line "gem install bundler"
    2.4. Run command line "bundle update --bundler"

## STEP3: Run test
    NOTE: Test scripts are in "spec" directory
    3.1. Run command line "bundle exec rspec" to run tests
    3.2. Open TestRails to check test result
    3.3. Open BrowserStack to read test report
