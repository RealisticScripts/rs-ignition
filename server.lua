local currentVersion = 'v1.0.0'

local function fetchLatestVersion(callback)
    PerformHttpRequest('https://api.github.com/repos/RealisticScripts/rs-ignition/releases/latest', function(statusCode, response)
        if statusCode == 200 then
            local data = json.decode(response)
            if data and data.tag_name then
                callback(data.tag_name)
            else
                print('[rs-ignition] Failed to fetch the latest version')
            end
        else
            print(('[rs-ignition] HTTP request failed with status code: %s'):format(statusCode))
        end
    end, 'GET')
end

local function checkForUpdates()
    fetchLatestVersion(function(latestVersion)
        if currentVersion ~= latestVersion then
            print('[rs-ignition] A new version of the script is available!')
            print(('[rs-ignition] Current version: %s'):format(currentVersion))
            print(('[rs-ignition] Latest version: %s'):format(latestVersion))
            print('[rs-ignition] Please update the script from: https://github.com/RealisticScripts/rs-ignition')
        else
            print('[rs-ignition] Your script is up to date!')
        end
    end)
end

checkForUpdates()
