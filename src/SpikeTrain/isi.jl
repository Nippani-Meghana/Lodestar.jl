module SpikeTrain

export calculate_isi

"""
    calculate_isi(spike_times, num_trials=nothing)
Calculates the Inter-Spike Intervals. If num_trials is provided, 
it assumes spike_times is a Vector of Vectors (one per trial).
"""
function calculate_isi(spike_times::AbstractVector, num_trials=nothing)
    if isnothing(num_trials) || num_trials <= 1
        return diff(spike_times)
    end

    # Handle Vector of Vectors (trials)
    all_isi = Float64[]
    for trial in spike_times
        if length(trial) > 1
            append!(all_isi, diff(trial))
        end
    end
    return all_isi
end

end 



