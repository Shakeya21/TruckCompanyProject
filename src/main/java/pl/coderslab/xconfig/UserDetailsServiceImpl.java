package pl.coderslab.xconfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.coderslab.roles.UserAccRepository;
import pl.coderslab.zdatabase.UserAcc;
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserAccRepository userAccRepository;

    public UserDetailsServiceImpl() {

    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserAcc user = userAccRepository.findByUsername(username);
        return new MyUserDetails(user);
    }
}
