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
    NOTE: Oest scripts are in "rspec" 
    3.1. Open file ".env" and setup cofiguration like below
    **cofiguration for running test from your PC/Laptop local**
            export test_environment = uat
            export hub = local
            export use_test_rail = yes
            export test_plan_id = 1
            use_screenshot = no

    **cofiguration for running test from BrowserStack**
            export test_environment = uat
            export hub = browserstack
            export use_test_rail = yes
            export test_plan_id = 1
            use_screenshot = no
            export bs_user = testvdc1
            export bs_access_key = z4gjxYshhqN7aUW7D4vP
            export bs_browser = Chrome
            export bs_os = Windows
            export bs_os_version = 10
            export bs_browser_version = 81.0
            export bs_resolution = 1920x1080
            
    3.2. Run command line "bundle exec rspec"

