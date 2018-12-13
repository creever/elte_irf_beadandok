create or replace PROCEDURE report_3(in_order_num IN varchar2) IS
    order_identifier VARCHAR2(64);
    order_date DATE;
    customer_id NUMBER;
    customer_addr VARCHAR2(128);
    customer_name VARCHAR2(128);
    counter NUMBER;
    gross_sum_price NUMBER;
    title VARCHAR2(255);
    unit VARCHAR2(32);
    list_price FLOAT;
    discount_group VARCHAR2(10);
    price FLOAT;
    sku VARCHAR(32);
    vat NUMBER;
BEGIN
    SELECT o.order_identifier, o.created_at, c.name, c.address, c.id, c.discount_group
    INTO order_identifier, order_date, customer_name, customer_addr, customer_id, discount_group
    FROM orders o 
    JOIN customers c ON c.id=o.customer_id
    WHERE o.order_identifier LIKE in_order_num;

    vat := 1.27;
    
    dbms_output.put_line(
        'Számla sz.:' || chr(9) ||
        order_identifier || chr(9) ||
        'Dátum:' || chr(9) ||
        to_char(order_date, 'yyyy-mm-dd')
    );
    
    dbms_output.put_line(
        'Vevõsz.:' || chr(9) ||
        customer_id
    );
    
    dbms_output.put_line(
        'Vevõ név' || chr(9) ||
        customer_name
    );
    
    dbms_output.put_line(
        'és cím:' || chr(9) ||
        customer_addr || chr(9) || chr(9) ||
        'Vásárlói r.sz.:' || chr(9) || in_order_num
    );

    dbms_output.put_line(
        'Tétel' || chr(9) ||
        'Cikk Sz.' || chr(9) ||
        'Megnevezés' || chr(9) ||
        'Egység' || chr(9) ||
        'Lista Ár' || chr(9) ||
        'Kedv. Kód' || chr(9) ||
        'Kedv. Ar' || chr(9) ||
        'Menny.' || chr(9) ||
        'Ár'
    );

    counter := 0;
    gross_sum_price := 0;
    FOR order_record IN 
    (
        SELECT * FROM order_products op LEFT JOIN orders o ON o.id = op.order_id WHERE o.order_identifier like in_order_num
    )
    LOOP
        counter := counter + 1;
        
        SELECT p.title, p.unit, p.price, p.sku INTO title, unit, list_price, sku FROM products p WHERE p.id LIKE order_record.product_id;
        IF discount_group LIKE 'A' THEN
            SELECT p.price_a INTO price FROM products p WHERE p.id LIKE order_record.product_id;
        ELSIF discount_group LIKE 'B' THEN
            SELECT p.price_b INTO price FROM products p WHERE p.id LIKE order_record.product_id;
        ELSIF discount_group LIKE 'C' THEN
            SELECT p.price_c INTO price FROM products p WHERE p.id LIKE order_record.product_id;
        ELSIF discount_group LIKE 'D' THEN
            SELECT p.price_d INTO price FROM products p WHERE p.id LIKE order_record.product_id;
        ELSE
            price := list_price;
        END IF;
        
        gross_sum_price := gross_sum_price + (price * order_record.quantity);

        dbms_output.put_line(
            counter || chr(9) ||
            sku || chr(9) ||
            title || chr(9) ||
            unit || chr(9) ||
            list_price || chr(9) ||
            discount_group || chr(9) ||
            price || chr(9) || 
            order_record.quantity || chr(9) ||
            price * order_record.quantity
        );
    END LOOP;
    
    dbms_output.put_line(
           chr(9)
    );
    
    dbms_output.put_line(
           chr(9) || chr(9) ||  chr(9) || chr(9) || 'Nettó összeg' || chr(9) || ROUND(gross_sum_price / vat, 2)
    );
    dbms_output.put_line(
            chr(9) || chr(9) || chr(9) || chr(9) ||  'Áfa' || chr(9) || chr(9) || ROUND(gross_sum_price - (gross_sum_price / vat), 2)
    );
    dbms_output.put_line(
            chr(9) || chr(9) || chr(9) || chr(9) || 'Számla össz.' || chr(9) || gross_sum_price
    );
END;