using Lodestar
using Test

@testset "SpikeTrain ISI Tests" begin
    #Triggering CLI
    @testset "Continuous Data (No Trials)" begin
        # A neuron firing every 10ms with some noise
        continuous_spikes = [10.2, 20.5, 30.1, 40.8, 50.2]
        isi_cont = calculate_isi(continuous_spikes)
        
        # Verify the length (N-1)
        @test length(isi_cont) == 4
        
        # Verify specific values (using ≈ for floating point comparison)
        @test isi_cont[1] ≈ 10.3
        @test isi_cont[2] ≈ 9.6
    end

    @testset "Trial-based Data" begin
        # 3 trials with varying lengths
        trial_data = [
            [1.0, 2.5, 4.0],      # Diff: [1.5, 1.5]
            [10.0, 11.2, 13.0],   # Diff: [1.2, 1.8]
            [20.0, 25.0]          # Diff: [5.0]
        ]
        
        isi_trials = calculate_isi(trial_data, 3)
        
        # Total ISI count should be (3-1) + (3-1) + (2-1) = 5
        @test length(isi_trials) == 5
        @test isapprox(isi_trials, [1.5, 1.5, 1.2, 1.8, 5.0])
    end

    @testset "Edge Cases" begin
        # Testing a trial with a single spike (should produce no ISI)
        single_spike_trial = [[1.0, 2.0], [5.0]]
        @test calculate_isi(single_spike_trial, 2) == [1.0]
        
        # Testing empty input
        @test isempty(calculate_isi(Float64[], 0))
    end

end