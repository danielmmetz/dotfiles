function clearhosts
	sed -i.bak '/onebox/d' ~/.ssh/known_hosts $argv;
end
