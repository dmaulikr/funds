project 'funds.xcodeproj'

# The main application target
target 'funds' do
    # Dependency management
    pod 'Typhoon', '3.5.1'
    pod 'RamblerTyphoonUtils/AssemblyCollector', '1.5.0'

    # Core Data
    pod 'MagicalRecord', '~> 2.3'

    # Navigation
    #pod 'RamblerSegues', '1.1.2'
    #pod 'ViperMcFlurry', '1.5.2'

    # Logging & crash reporting
    pod 'Fabric'
    pod 'Crashlytics'

    # Other
    pod 'RamblerAppDelegateProxy', '0.0.3'

    # Unit tests dependencies
    target 'fundsTests' do
        pod 'OCMock', '3.3.1'
        #pod 'MMBarricade', '~> 1.0.1'
        pod 'RamblerTyphoonUtils/AssemblyTesting', '1.5.0'
    end
end
