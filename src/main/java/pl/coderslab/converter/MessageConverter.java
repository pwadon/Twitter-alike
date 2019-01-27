package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Message;
import pl.coderslab.repository.MessageRepository;

public class MessageConverter implements Converter<String, Message> {

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public Message convert(String s) {
        return messageRepository.findOne(Long.parseLong(s));
    }
}
