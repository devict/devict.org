Rails.application.middleware.use OmniAuth::Builder do
    provider :twitter, 'z33UOOpJmBW4OlWB5ZdP0A', 'rKWY41eV5B3yEBXbgsIPDO6wogWKuXzU6PrNWGwk0s'
    provider :github, 'aba62c5941e052569974', '09990402d3f1df0513ad2ab949c56530539a7df9'
end
