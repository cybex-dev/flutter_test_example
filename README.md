# flutter_test_example
Example application with counter, locale &amp; corresponding tests

## Getting Started

Generate localizations
```
flutter gen-l10n
```

## Testing & Coverage

### Run tests with 
```
flutter test
```

### Run tests with coverage report
```
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html
```

Open coverage report with 
```
open coverage/html/index.html
```
