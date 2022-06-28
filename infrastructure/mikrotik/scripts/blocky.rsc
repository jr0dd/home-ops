:local blocky 10.10.2.53
:local fallbackDns 1.1.1.1
:local currentDns [/ip dns get servers]
:local status

:do {
    :set status [/tool fetch url="http://$blocky:4000/api/blocking/status" as-value output=user]
    :if ($currentDns != $blocky) do={
        /ip dns set servers=$blocky
        /ip dns cache flush
        :log info "Blocky is up, ad-blocking is enabled"
    }
} on-error={
    :if ($currentDns != $fallbackDns) do={
        /ip dns set servers=$fallbackDns
        /ip dns cache flush
        :log error "Blocky is down, switched to Cloudflare DNS"
    }
}
