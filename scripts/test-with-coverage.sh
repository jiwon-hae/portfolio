#! /bin/bash

# Install https://pub.dev/packages/remove_from_coverage
flutter pub global activate remove_from_coverage

red=$(tput setaf 1)
none=$(tput sgr0)
filename=
open_browser=

run_tests() {
    if [[ -f "pubspec.yaml" ]]; then
        rm -f coverage/lcov.info
        flutter test --coverage "$filename"
        ch_dir
    else
        printf "\n${red}Error: this is not a Flutter project${none}\n"
        exit 1
    fi
}

echo '############################### Running tests ################################'
run_tests

echo '############################### Removing unwanted files ######################'
# Remove with PATTERN
flutter pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '\.g\.dart$'  -r '\.gr\.dart$'  -r '\.freezed\.dart$' -r '\.config\.dart$'
flutter pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r 'lib/bloc/*' -r 'lib/common/*' -r 'lib/di/*' -r 'lib/infrastructure/*' -r 'lib/presentation/*'

echo '############################### Generating coverage ##########################'
genhtml coverage/lcov.info -o coverage