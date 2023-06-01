return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.1",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 35,
  properties = {},
  tilesets = {
    {
      name = "background",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "background.png",
      imagewidth = 512,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 512,
      tiles = {}
    },
    {
      name = "spritesheet",
      firstgid = 513,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "spritesheet.png",
      imagewidth = 512,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 512,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 20,
      id = 1,
      name = "background",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 24, 25, 26, 27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 219, 220, 221, 222, 223, 0, 0,
        0, 0, 0, 0, 0, 56, 57, 58, 59, 60, 61, 62, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 251, 252, 253, 254, 255, 0, 0,
        0, 0, 0, 0, 0, 88, 89, 90, 91, 92, 93, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 219, 220, 221, 222, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 120, 121, 122, 123, 124, 125, 126, 127, 0, 0, 0, 0, 0, 182, 183, 184, 185, 0, 0, 0, 24, 25, 26, 27, 28, 0, 0, 0, 0, 0, 251, 252, 253, 254, 255, 0, 0, 0, 0, 0, 0, 0, 0, 182, 183, 184, 185, 0, 0, 0, 0, 0, 0, 0, 0,
        182, 183, 184, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 214, 215, 216, 217, 0, 0, 0, 56, 57, 58, 59, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 214, 215, 216, 217, 0, 0, 0, 0, 0, 0, 0, 0,
        214, 215, 216, 217, 0, 0, 0, 0, 0, 0, 186, 187, 188, 189, 190, 191, 0, 0, 246, 247, 248, 249, 0, 0, 0, 88, 89, 90, 91, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 246, 247, 248, 249, 0, 0, 0, 0, 0, 0, 0, 0,
        246, 247, 248, 249, 0, 0, 0, 0, 0, 0, 218, 219, 220, 221, 222, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120, 121, 122, 123, 124, 125, 126, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 21, 22,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 250, 251, 252, 253, 254, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 52, 53, 54,
        0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 12, 13, 14, 15, 0, 19, 20, 21, 22, 0, 0, 0, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 13, 14, 304, 0, 306, 13, 14, 289, 290, 291, 292, 293, 294, 295, 296, 84, 85, 86,
        0, 0, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 0, 44, 45, 46, 47, 0, 51, 52, 53, 54, 0, 0, 0, 44, 45, 46, 47, 0, 0, 0, 0, 0, 0, 0, 0, 290, 291, 306, 44, 45, 46, 0, 0, 44, 45, 46, 321, 322, 323, 324, 325, 326, 327, 328, 116, 117, 118,
        80, 81, 82, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 0, 76, 77, 78, 79, 0, 83, 84, 85, 86, 80, 81, 82, 76, 77, 78, 79, 0, 0, 0, 0, 80, 81, 82, 0, 322, 323, 324, 76, 77, 78, 0, 0, 76, 77, 78, 353, 354, 355, 356, 357, 358, 359, 360, 148, 149, 150,
        112, 113, 114, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 0, 108, 109, 110, 111, 0, 115, 116, 117, 118, 112, 113, 114, 108, 109, 110, 111, 0, 0, 0, 0, 112, 113, 114, 336, 368, 355, 356, 108, 109, 110, 111, 0, 108, 109, 110, 111, 0, 80, 81, 82, 0, 0, 179, 180, 181, 182,
        144, 145, 146, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 0, 140, 141, 142, 143, 0, 147, 148, 149, 150, 144, 145, 146, 140, 141, 142, 143, 0, 0, 0, 0, 144, 145, 146, 0, 0, 0, 0, 140, 141, 142, 143, 0, 140, 141, 142, 143, 0, 112, 113, 114, 0, 0, 0, 212, 213, 0,
        176, 177, 178, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 0, 172, 173, 174, 175, 0, 179, 180, 181, 0, 176, 177, 178, 172, 173, 174, 175, 0, 329, 330, 331, 176, 177, 178, 0, 0, 0, 0, 172, 173, 174, 175, 0, 172, 173, 174, 175, 0, 144, 145, 146, 0, 0, 0, 212, 213, 0,
        208, 209, 210, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 0, 204, 205, 206, 207, 0, 211, 212, 213, 0, 208, 209, 210, 204, 205, 206, 207, 0, 361, 362, 363, 208, 209, 210, 0, 0, 0, 0, 204, 205, 206, 207, 0, 204, 205, 206, 207, 0, 176, 177, 178, 0, 0, 0, 212, 213, 0,
        240, 241, 242, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 0, 236, 237, 238, 239, 0, 243, 244, 245, 0, 240, 241, 242, 236, 237, 238, 239, 0, 0, 0, 0, 240, 241, 242, 0, 0, 0, 0, 236, 237, 238, 239, 0, 236, 237, 238, 239, 0, 0, 241, 0, 0, 0, 0, 244, 245, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 20,
      id = 2,
      name = "foreground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 674, 0, 0, 0,
        705, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 706, 707,
        737, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 738, 739,
        769, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 770, 771
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "solid",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "ground",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 272,
          width = 960,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 6,
          name = "border_left",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 16,
          height = 272,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 26,
          name = "border_right",
          type = "",
          shape = "rectangle",
          x = 944,
          y = 0,
          width = 16,
          height = 272,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "spawn point",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 5,
          name = "Player",
          type = "",
          shape = "rectangle",
          x = 150,
          y = 200,
          width = 10,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["spawnpoint"] = 1
          }
        },
        {
          id = 34,
          name = "Player",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["spawnpoint"] = 2
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "items",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 23,
          name = "guide_1",
          type = "guide",
          shape = "rectangle",
          x = 192,
          y = 240,
          width = 48,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "Press 'Z' to open your Shroomdex"
          }
        },
        {
          id = 24,
          name = "guide_2",
          type = "guide",
          shape = "rectangle",
          x = 480,
          y = 240,
          width = 48,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "Go collect all the mushrooms!"
          }
        },
        {
          id = 25,
          name = "twin mushroom",
          type = "mushroom",
          shape = "rectangle",
          x = 720,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["shroomidx"] = 1
          }
        },
        {
          id = 28,
          name = "portal",
          type = "portal",
          shape = "rectangle",
          x = 928,
          y = 208,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["spawnpoint"] = 1,
            ["target"] = "forest"
          }
        }
      }
    }
  }
}
