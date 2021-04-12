CREATE TABLE Ord(
                      orderId BIGINT GENERATED ALWAYS AS  IDENTITY,
                      registration_id BIGINT,
                      product_Id BIGINT,
                      PRIMARY KEY(orderId),
                      CONSTRAINT fk_registration
                          FOREIGN KEY (registration_id)
                              REFERENCES users(id),
                      CONSTRAINT fk_product
                          FOREIGN KEY (product_Id)
                              REFERENCES Product(id)
);