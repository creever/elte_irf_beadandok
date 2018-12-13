create or replace PROCEDURE report_1(product_id_input IN NUMBER) IS
    product_title VARCHAR2(255);
    discount_price real;
BEGIN
    dbms_output.put_line(
        'Cikkszám:' || chr(9) || product_id_input
    );
    
    SELECT title INTO product_title 
    FROM products 
    WHERE id = product_id_input;
    
    dbms_output.put_line(
        'Megnevezés:' || chr(9) || product_title
    );
    
    dbms_output.put_line(
        'V.R.Sz.' || chr(9) || 
        'V.R.Dátum' || chr(9) || 
        'Vevõ Sz.' || chr(9) || 
        'Név' || chr(9) || 
        'Mennyiség' || chr(9) || 
        'Ár'
    );
    FOR item IN 
    (
        SELECT 
            o.order_identifier,
            o.created_at,
            c.id as cid,
            c.name as cname,
            op.quantity,
            p.price_a,
            p.price_b,
            p.price_c,
            p.price_d,
            p.price,
            c.discount_group
        FROM products p
        LEFT JOIN order_products op ON op.product_id = p.id
        LEFT JOIN orders o ON op.order_id = o.id
        LEFT JOIN customers c ON o.customer_id = c.id
        WHERE p.id = product_id_input
    )
    LOOP
        IF item.discount_group LIKE 'A' THEN
            discount_price := item.quantity * item.price_a;
        ELSIF item.discount_group LIKE 'B' THEN
            discount_price := item.quantity * item.price_b;
        ELSIF item.discount_group LIKE 'C' THEN
            discount_price := item.quantity * item.price_c;
        ELSIF item.discount_group LIKE 'D' THEN
            discount_price := item.quantity * item.price_d;
        ELSE
            discount_price := item.quantity * item.price;
        END IF;
        dbms_output.put_line(
            item.order_identifier || chr(9) || 
            to_char(item.created_at, 'yyyy-mm-dd') || chr(9) || 
            item.cid || chr(9) || 
            item.cname || chr(9) || 
            item.quantity || chr(9) ||
            discount_price
        );
    END LOOP;
END;