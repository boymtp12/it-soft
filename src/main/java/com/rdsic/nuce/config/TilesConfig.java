package com.rdsic.nuce.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@ComponentScan(basePackages = "com.rdsic.nuce.config")
public class TilesConfig implements WebMvcConfigurer {

    @Bean(name = "viewResolver")
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedMethods("*").allowedOrigins("*");
            }
        };
    }

    @Bean(name = "tilesConfigurer")
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions("/WEB-INF/tiles.xml");
        tilesConfigurer.setCheckRefresh(true);

        return tilesConfigurer;
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver(viewResolver);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/admin/**")
                .addResourceLocations("classpath:/admin/");
        registry.addResourceHandler("/js_admin/**")
                .addResourceLocations("classpath:/admin/js_admin/");
        registry.addResourceHandler("/css_admin/**")
                .addResourceLocations("classpath:/admin/css_admin/");
        registry.addResourceHandler("/ajax_admin/**")
                .addResourceLocations("classpath:/admin/js_admin/ajax_admin");
        registry.addResourceHandler("/libs_admin/**")
                .addResourceLocations("classpath:/admin/js_admin/libs_admin");


        registry.addResourceHandler("/plugin_admin/**")
                .addResourceLocations("classpath:/admin/plugin_admin/");


        registry.addResourceHandler("/client/**")
                .addResourceLocations("classpath:/client/");

        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/client/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/client/js/");
        registry.addResourceHandler("/ajax/**")
                .addResourceLocations("classpath:/client/js/ajax");

        registry.addResourceHandler("/image/**")
                .addResourceLocations("classpath:**/client/image/");
        registry.addResourceHandler("/reactnative/**")
                .addResourceLocations("classpath:/client/image/reactnative/");
        registry.addResourceHandler("/images_Trang_Chu/**")
                .addResourceLocations("classpath:/client/image/images_Trang_Chu/");
        registry.addResourceHandler("/img_java/**")
                .addResourceLocations("classpath:/client/image/img_java/");
        registry.addResourceHandler("/img_python/**")
                .addResourceLocations("classpath:/client/image/img_python/");
        registry.addResourceHandler("/img_minecraft/**")
                .addResourceLocations("classpath:/client/image/img-minecraft/");
        registry.addResourceHandler("/img_robot/**")
                .addResourceLocations("classpath:/client/image/img_robot/");
        registry.addResourceHandler("/img_scrath/**")
                .addResourceLocations("classpath:/client/image/img_scrath/");
        registry.addResourceHandler("/img_web/**")
                .addResourceLocations("classpath:/client/image/img_web/");


//        registry.addResourceHandler("/file/**")
//                .addResourceLocations("classpath:/file/");
//        registry.addResourceHandler("/icon/**")
//                .addResourceLocations("classpath:/file/icon/");



    }

}
