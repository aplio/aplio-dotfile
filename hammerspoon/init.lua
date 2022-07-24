hs.hotkey.bind({"cmd"}, "'", function()
    local alacritty = hs.application.find('alacritty')
    local chrome = hs.application.find('chrome')
    local logseq = hs.application.find('logseq')
    local slack = hs.application.find('slack')
    if alacritty:isFrontmost() then
      hs.application.launchOrFocus("/Applications/Google Chrome.app")
    elseif chrome:isFrontmost() then
      hs.application.launchOrFocus("/Applications/logseq.app")
    elseif logseq:isFrontmost() then
      hs.application.launchOrFocus("/Applications/Slack.app")
    elseif slack:isFrontmost() then
      hs.application.launchOrFocus("/Applications/Alacritty.app")
    else
      hs.application.launchOrFocus("/Applications/Alacritty.app")
    end
  end)
  