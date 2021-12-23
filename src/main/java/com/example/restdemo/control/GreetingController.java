package com.example.restdemo.control;

import com.example.restdemo.model.Greeting;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
public class GreetingController {

    @GetMapping("/{name}")
    public Greeting sayHello(
            @PathVariable("name") String name,
            @RequestParam(value="message", defaultValue = "Hello ") String message) {
        return new Greeting(name, message + name);
    }
}
