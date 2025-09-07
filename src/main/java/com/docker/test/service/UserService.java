package com.docker.test.service;

import com.docker.test.entity.User;
import com.docker.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public User createUser(User user){
        return userRepository.save(user);
    }

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public User updateUser(User user, Long id){
        User existingUser = userRepository.findById(id).orElseThrow();
        existingUser=user;
        return userRepository.save(existingUser);
    }

    public Optional<User> getUserById(Long id){
        return userRepository.findById(id);
    }

    public User deletUser(Long id){
        User existingUser = userRepository.findById(id).orElseThrow();
        userRepository.delete(existingUser);
        return existingUser;
    }
}
