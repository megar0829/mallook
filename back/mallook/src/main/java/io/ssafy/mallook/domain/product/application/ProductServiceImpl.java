package io.ssafy.mallook.domain.product.application;

import io.ssafy.mallook.domain.product.dao.ProductCustomRepository;
import io.ssafy.mallook.domain.product.dao.ProductCustomRepositoryImpl;
import io.ssafy.mallook.domain.product.dao.ProductRepository;
import io.ssafy.mallook.domain.product.dto.response.ProductListDto;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductCustomRepository productCustomRepository;

    @Override
    public List<ProductListDto> getProductList(Pageable pageable) {
        return productCustomRepository.findAllProduct()
                .stream()
                .map(ProductListDto::toDto)
                .toList();
    }
}
