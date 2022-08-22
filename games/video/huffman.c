#define BIT(x,n) (((x) >> (n)) & 1)
#define bsize 768
struct huffman_node {
    char data;
    struct huffman_node *left;
    struct huffman_node *right;
};


unsigned int bitc;
char getBit(){
    char r = BIT(imgind(bitc/8 + boff), 7-(bitc%8));

    ++bitc;
    return r;
}
unsigned char getByte(){
    unsigned char out = 0;
    int bpos = bitc/8;
    char st = bitc%8;
    for (int i = 7; i >= 0; --i){
        if (st == 8){
            st = 0;
            ++bpos;
        }
        char b = BIT(imgind(bpos+boff), 7-(st));
        if (b == 1){

            out|=b<<(i);

            
        }
        ++bitc;
        ++st;
    }
    return out;
}
struct huffman_node *loadNode(){
    char bt = getBit();
    // struct huffman_node *ret = (struct huffman_node*)malloc(sizeof(struct huffman_node));
    memmk(ret, struct huffman_node);
    ret->data = 0;
    ret->left = 0;
    ret->right = 0;

    if (bt == 1){
        ret->left = loadNode();
        ret->right = loadNode();
    }else{
        ret->data = getByte();
    }
    return ret;

}
void run()
{
    bitc=0;
    char off = getByte();
    if (off !=0){
        bitc+=8-off;
    }


    struct huffman_node *ret = loadNode();
    off = getByte();
    if (off !=0){
        bitc+=8-off;
    }
    struct huffman_node *cnode = ret;
    

    int pos = 0;
    while (bitc < lind(curr)*8){
        char b = getBit();
        if (b == 0){
            cnode = cnode->left;
        }
        else{
            cnode = cnode->right;   
        }

        if (cnode->left == 0){
            buff[pos] = cnode->data;
            cnode = ret;
            ++pos;
            if (pos > bsize)
                return;
        }
    }


}