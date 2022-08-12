const char act[] = {0x02, 0x04, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0x80, 0x08, 0x02, 0x00,
0x01, 0x04, 0x00, 0x10, 0x00, 0x40, 0x00, 0x01, 0x00, 0x08, 0x02, 0x00,
0x02, 0x11, 0x08, 0x54, 0x00, 0x81, 0x10, 0x90, 0x88, 0x82, 0x12, 0x20,
0x04, 0x85, 0x4a, 0x08, 0x01, 0x45, 0x20, 0x91, 0x49, 0x0a, 0x92, 0xa0,
0x00, 0x85, 0x0a, 0x08, 0x00, 0x05, 0x21, 0x21, 0x49, 0x0a, 0x12, 0xa0,
0x00, 0x85, 0x42, 0x08, 0x00, 0x05, 0x29, 0x21, 0x49, 0x0a, 0x82, 0xa0,
0x00, 0x15, 0x08, 0x54, 0x00, 0x01, 0x21, 0x21, 0x09, 0x0a, 0x12, 0x20,
0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80,
0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80}; // HEIGHT:9 // WIDTH:12 


const char heart1[] = {0x61, 0x80,
0x92, 0x40,
0x8c, 0x40,
0x40, 0x80,
0x21, 0x00,
0x12, 0x00,
0x0c, 0x00}; // HEIGHT:7 // WIDTH:2 


const char itm[] = {0x00, 0x21, 0x01,
0x00, 0x81, 0x02,
0x20, 0x82, 0x82,
0x10, 0x22, 0x82,
0x20, 0x80, 0x82,
0x20, 0x84, 0x42,
0x00, 0x24, 0x42}; // HEIGHT:7 // WIDTH:3 


const char gui1[] = {0x1f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf8,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
0x1f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf8,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x03, 0xff, 0xfc, 0x07, 0xff, 0xfc, 0x3f, 0xff, 0xe0, 0x3f, 0xff, 0xc0,
0x02, 0x08, 0x04, 0x04, 0x00, 0x04, 0x20, 0x00, 0x20, 0x20, 0x00, 0x40,
0x02, 0x18, 0x04, 0x04, 0xc6, 0x74, 0x2e, 0xe5, 0x20, 0x2e, 0x54, 0x40,
0x02, 0xff, 0xe4, 0x05, 0x28, 0x24, 0x24, 0x4a, 0xa0, 0x2a, 0x56, 0x40,
0x02, 0xff, 0xf4, 0x05, 0xe8, 0x24, 0x24, 0x4a, 0xa0, 0x2e, 0x55, 0x40,
0x02, 0x18, 0x04, 0x05, 0x26, 0x24, 0x2e, 0x4a, 0xa0, 0x29, 0x75, 0x40,
0x02, 0x08, 0x04, 0x04, 0x00, 0x04, 0x20, 0x00, 0x20, 0x20, 0x00, 0x40,
0x03, 0xff, 0xfc, 0x07, 0xff, 0xfc, 0x3f, 0xff, 0xe0, 0x3f, 0xff, 0xc0}; // HEIGHT:28 // WIDTH:12 


const char attack[] = {0x08, 0x80, 0x00, 0x00, 0x00, 0x19, 0x80, 0x00, 0x00, 0x00, 0x01, 0x10,
0x05, 0x00, 0x00, 0x00, 0x00, 0x26, 0x40, 0x00, 0x00, 0x00, 0x00, 0xa0,
0x02, 0x00, 0x00, 0x00, 0x00, 0x26, 0x40, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x46, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40,
0x02, 0x00, 0x00, 0x00, 0x00, 0x26, 0x40, 0x00, 0x00, 0x00, 0x00, 0x40,
0x05, 0x00, 0x00, 0x00, 0x00, 0x26, 0x40, 0x00, 0x00, 0x00, 0x00, 0xa0,
0x08, 0x80, 0x00, 0x00, 0x00, 0x19, 0x80, 0x00, 0x00, 0x00, 0x01, 0x10}; // HEIGHT:15 // WIDTH:12 


const char sanHead[] = {0x01, 0xfe, 0x00,
0x06, 0x01, 0xe0,
0x38, 0x00, 0x70,
0x30, 0x00, 0x30,
0x40, 0x00, 0x08,
0x40, 0x00, 0x0c,
0x80, 0x00, 0x04,
0x8f, 0x87, 0xc4,
0xbf, 0x87, 0xf4,
0xbf, 0x87, 0xf4,
0xbf, 0x87, 0xf4,
0x7f, 0xb7, 0xec,
0x44, 0x78, 0x08,
0x40, 0x78, 0x08,
0x5e, 0x00, 0xe8,
0x6f, 0xff, 0xe8,
0x44, 0xa5, 0xc8,
0x67, 0xa5, 0x98,
0x31, 0xff, 0x30,
0x1e, 0x00, 0xe0,
0x07, 0xff, 0xc0}; // HEIGHT:21 // WIDTH:3 